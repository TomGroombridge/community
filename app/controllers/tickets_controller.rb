class TicketsController < ApplicationController
	def create
		# logic: e.g. check ticket avaailability
		redirect_to new_payment_path(id: params[:dates], quantity: params[:quantity])
	end
end
