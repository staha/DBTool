# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Search < ActiveRecord::Base	
  attr_accessible :end_date, :start_date

	def transcript
  		@transcript ||= find_transcripts
  		
  		return @transcript
	end

	private 

	def find_transcripts
		transcript = Transcript.order("created_at DESC")
		transcript = transcript.where("created_at >= ?", self.start_date) if self.start_date.present?
    	transcript = transcript.where("created_at <= ?", self.end_date) if self.end_date.present?	
    	return transcript
    end	
end




