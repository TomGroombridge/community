class EntriesController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@entry = @ticket.entries.build
		@ticket.number_of_dates.times{@entry.entry_selections.build}
		@course_dates = @ticket.course_date.course.course_dates
		@course_dates.map do |cd|
			cd.start_time ==  cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
		end
		@course_date = @ticket.course_date
	end

	def create
		@entry = @ticket.entries.create(params[:entry].permit(:ticket_id, entry_selections_attributes:[:course_date_id, :entry_id]))
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
