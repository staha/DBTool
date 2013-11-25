class TranscriptController < ApplicationController
  #helper_method :sort_column, :sort_direction

  
  # def index
  #   @transcript = ""# Transcript.first
  #   #@transcript = Transcript.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  # end

  def show
    @transcript = Transcript.find params[:id]
    
  end

  # def sort_column
  #   Transcript.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  # end
  
  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  # end

  # def start_date

  # end

  # def transcripts
  #     @transcripts ||= find_transcripts
      
  #     return @transcripts
  # end

  # def find_transcripts
  #   transcripts = Transcript.find(231)
  # end

end
