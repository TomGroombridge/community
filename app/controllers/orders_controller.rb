class OrdersController < ApplicationController
	before_action :fetch_and_authorize_ticket, :except => [:index]

	def new
		@order = Order.new
		@order.ticket_id = @ticket.id
		raise @order.inspect
		@ticket.number_of_dates.times{@entry.entry_selections.build}
		@course_dates = @ticket.course_date.course.course_dates
		# @start_time = []
		@course_dates.map do |cd|
			cd.start_time ==  cd.start_date_time.strftime("%A, %d %b %Y %l:%M %p")
		end
		@course_date = @ticket.course_date
		# raise @start_time
	end


	private

	def fetch_and_authorize_ticket
		@ticket = Ticket.find(params[:ticket_id])
	end
end
