class SearchController < ApplicationController
  def _form
  end

  def new
  	  @search = ''

  end

  def create
    @search = Search.create! params[:search]
    redirect_to @search
  end

end
