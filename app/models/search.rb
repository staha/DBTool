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
	
	def dialogue_lines(column, direction)
  		@dialogue_lines ||= find_dialogue_lines(column, direction)
  		
  		return @dialogue_lines
	end

	private 

	def find_dialogue_lines(column, direction) 

		if !column
			column = "created_at"
		end
		if !direction
			direction = "ASC"
		end

		dialogue_lines = DialogueLine.readonly.order(column + " " + direction)
		dialogue_lines = dialogue_lines.where("speaker != ?", "Tina Jones")
		dialogue_lines = dialogue_lines.where("match_status IS NOT NULL")
		dialogue_lines = dialogue_lines.where("match_status != ?", "good") 
		dialogue_lines = dialogue_lines.where("listener = ?", "Tina Jones")
		dialogue_lines = dialogue_lines.where("created_at >= ?", self.start_date) if self.start_date.present?
    	dialogue_lines = dialogue_lines.where("created_at <= ?", self.end_date) if self.end_date.present?	
    	return dialogue_lines
    end	
end




