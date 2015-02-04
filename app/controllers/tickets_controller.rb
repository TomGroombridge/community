class TicketsController < ApplicationController
	def create
		# logic: e.g. check ticket avaailability
		redirect_to new_payment_path(id: params[:start_date], quantity: params[:quantity])
	end
end
