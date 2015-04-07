class Entry < ActiveRecord::Base
	belongs_to :ticket
	has_many :entry_selections
	has_many :payments
	accepts_nested_attributes_for :entry_selections
end
