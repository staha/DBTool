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


    @results = @search.dialogue_lines.page(params[:page]).per_page(5)
  end

  def show  
    @search = Search.find params[:id]
    @dialogue_lines = @search.dialogue_lines.page(params[:page]).per_page(100)
  end


  # def index
  #   @transcript = Transcript.all
  # 	start_date = params[:start_date] 
  # 	end_date   = params[:end_date] 

  # 	if params[:start_date] && params[:end_date]
  # 		start_date = params[:start_date]
  # 		end_date   = params[:end_date]
		# @foos = Foo.find(:all, :conditions => ['created_at BETWEEN ? AND ?,' start_date, end_date
  #   end
  #  responds_to do |format|
  #      format.html
  
  def create
    @search = Search.create! params[:search]
    redirect_to @search
  end


end
