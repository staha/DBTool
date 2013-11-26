class SearchController < ApplicationController
 

  def new
    @search = Search.new
  end

  def index
    @start_date = params[:search][:start_date]
    @end_date = params[:search][:end_date]

    @search = Search.new
    @search.start_date = @start_date
    @search.end_date = @end_date


    @results = @search.dialogue_lines.page(params[:page]).per_page(15)
  
    respond_to do |format|
      format.html
      format.csv { send_data @results.to_csv }
      format.xls  { send_data @results.to_csv(col_sep: "\t") }
    end  
  end

  def show  
    # @search = Search.find params[:id]
    # @dialogue_lines = @search.dialogue_lines.page(params[:page]).per_page(100)
  end

  
  def create
    @search = Search.create! params[:search]
    redirect_to @search
  end


end
