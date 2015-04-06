class EntriesController < ApplicationController

	def new
		@ticket = Ticket.find(params[:ticket_id])
		@entry = @ticket.entries.build.create
		@entry_selections = @entry.entry_selections.build
		raise @entry_selections.inspect
	end


end
