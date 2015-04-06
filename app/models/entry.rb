class Entry < ActiveRecord::Base
	belongs_to :ticket
	has_many :entry_selections
end
