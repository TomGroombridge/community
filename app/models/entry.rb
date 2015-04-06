class Entry < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :payment
	has_many :entry_selections
end
