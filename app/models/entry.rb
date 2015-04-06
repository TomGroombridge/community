class Entry < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :payment
	has_many :entry_selections
	accepts_nested_attributes_for :entry_selections
end
