class EntriesController < ApplicationController

	def new
		@ticket = Ticket.find(params[:ticket_id])
		@entry = @ticket.entries.build
		@ticket.number_of_dates.times{@entry.entry_selections.build}
		@entry_selections = @entry.entry_selections
	end

	def create

	end


end
