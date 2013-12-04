class SearchController < ApplicationController
 helper_method :sort_column, :sort_direction

  def new
    @search = Search.new
  end

  def index
    #return render text: params
    @start_date = params[:search][:start_date]
    @end_date = params[:search][:end_date]
    @sort = params[:sort]
    @direction = params[:direction]

    @search = Search.new
    @search.start_date = @start_date
    @search.end_date = @end_date

    if params[:commit]
      @results = @search.dialogue_lines(params[:sort],params[:direction]).page(params[:page]).per_page(15)
    else
      @results = @search.dialogue_lines(params[:sort],params[:direction])
    end
      respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv }
      format.xls  { send_data @results.to_csv(col_sep: "\t") }
    end  
  end

  private
  
  def sort_column
    DialogueLine.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
