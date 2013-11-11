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

	def transcripts
  		@transcripts ||= find_transcripts
  		
  		return @transcripts
	end

	def find_transcripts
		transcripts = Transcript.scoped
	end

end




