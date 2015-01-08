class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
end

def edit
	@user = User.find(params[:id])	
end

def update	
	@user = User.find(params[:id])	
	@user.update_attributes(params[:user].permit(:first_name, :last_name, :contact_number, :company_name, :description, :facebook, :twitter, :instagram, :google, :pinterest, :admin))
	redirect_to current_user	
end

def index
	@users = User.all
end

def course_providers_index	
	@course_providers = []	
	User.all.each do |user|
		if user.admin == true
			@course_providers << user		
		end
	end 
	@course_providers
end

end
