class Entry < ActiveRecord::Base
	belongs_to :ticket
	has_many :entry_selections
	has_one :payment
	accepts_nested_attributes_for :entry_selections
end
