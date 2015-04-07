class EntriesController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@entry = @ticket.entries.build
		3.times{@entry.entry_selections.build}
		@course_datess = @ticket.course_date.course.course_dates
	end

	def create
		@entry = @ticket.entries.create(params[:entry].permit(:ticket_id, entry_selections_attributes:[:course_date_id, :entry_id]))
		# raise @entry.entry_selections.inspect
		if @entry.save
			redirect_to new_payment_path(:id => @ticket.id, :course_date_id => @ticket.course_date.id, :entry_id => @entry.id)
		else
			raise "error"
		end
	end

	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end

	def course_params
    params.require(:entry).permit(:ticket_id, entry_selections_attributes:[:course_date_id])
	end


end
