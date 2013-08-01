require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
	test "signup" do
  	visit "/signup"

  	assert page.has_content? "Sign up is quick"

  	fill_in "user[name]", with: "Stuart"
  	fill_in "user[email]", with: "sg@sg.com"
  	fill_in "user[password]", with: "password"
  	fill_in "user[password_confirmation]", with: "password"
  	click_button "Sign Up"

  	assert page.has_content? "Account created!"
  end
end
