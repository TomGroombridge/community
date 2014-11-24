class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
end

def edit
	@user = User.find(params[:id])
end

def update	
	@user = User.find(params[:id])
	@user.update_attributes(params[:user].permit(:name))
	redirect_to current_user	
end

end
