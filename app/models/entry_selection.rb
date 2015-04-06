class EntrySelection < ActiveRecord::Base
	belongs_to :entry
	belongs_to :course_date
end
