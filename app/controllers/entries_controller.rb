class EntriesController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@entry = @ticket.entries.build
		@entry.entry_selections.build
		# @entry.entry_selections.build
	end

	def create
		@entry = @ticket.entries.create(params[:entry].permit(:ticket_id, entry_selections_attributes:[:course_date_id, :entry_id]))
		# @entry_selections = @entry.entry_selections.create(params[:entry].permit(:course_date_id))
		raise @entry.entry_selections.inspect
	end

	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end

	def course_params
    params.require(:entry).permit(:ticket_id, entry_selections_attributes:[:course_date_id])
	end


end
