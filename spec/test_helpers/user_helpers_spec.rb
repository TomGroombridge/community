module CreateUserHelper

	def user_sign_in
		visit "/"
		click_link "signIn"
		fill_in "user_email", with: "#{@user.email}"
		fill_in "user_password", with: "#{@user.password}"
    click_button('signIn')
	end

end