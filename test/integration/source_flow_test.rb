require 'test_helper'

class TopicsFlowTest < ActionDispatch::IntegrationTest
  test "users can add sources" do
  	setup_signed_up_user
  	visit topic_path(Topic.first)
  	find('.btn-new-source').click_button('+')

  	assert page.has_content? "Name"
  	assert page.has_content? "Address"
  	
  	click_button "Submit resource"
  	assert page.has_content? "Name can't be blank"

  	fill_in "source[name]", with: "Twitter"
    fill_in "source[url]", with: "www.twitter.com"
    click_button "Submit resource"

    assert_equal current_path, topic_path(Topic.first)
    assert page.has_content? "Thanks for submitting a resource!"
  end
end
