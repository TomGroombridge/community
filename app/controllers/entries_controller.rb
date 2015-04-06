class EntriesController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		# @ticket = Ticket.find(params[:ticket_id])
		@entry = @ticket.entries.build
		# raise @ticket.entries.inspect
		# @entry = @ticket.entries.build(params[:entry])
		# @course_date = @course.course_dates.build
		# @entry = Entry.new
		# @entry.ticket_id = @ticket.id

		# @entry.entry_selections.build
		# @entry_selections = @entry.entry_selections
		# @course = @ticket.course_date.course
		# @course_date = @ticket.course_date
	end

	def create
		# @entry = @ticket.entries.create(params[:course_date].permit()
		@entry = @ticket.entries.create(params[:entry].permit(:ticket_id, entry_selections_attributes:[:entry_id, :course_date_id]))
		raise @entry.inspect
	end

	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
		# raise 'Unauthorized' unless @ticket.course_date.course.user == current_user
	end


end
