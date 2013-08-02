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

  test "login with email" do
    setup_signed_up_user
    visit "/login"

    fill_in "user[email]", with: "zf@zg.com"
    fill_in "user[password]", with: "password"
    click_button "Login"

    assert_equal current_path, root_path

    # can't relog if already logged in
    visit "/login"

    assert_equal current_path, root_path
  end

  test "can login with username" do

    # can login with username instead
    visit "/login"

    fill_in "user[email]", with: "ZeroFries"
    fill_in "user[password]", with: "password"
    click_button "Login"

    assert_equal current_path, root_path
  end
end
