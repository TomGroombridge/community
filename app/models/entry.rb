class Entry < ActiveRecord::Base
	belongs_to :ticket
	has_many :entry_selections
	belongs_to :payments
	accepts_nested_attributes_for :entry_selections
end
