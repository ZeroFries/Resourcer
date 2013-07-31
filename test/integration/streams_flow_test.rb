require 'test_helper'

class StreamsFlowTest < ActionDispatch::IntegrationTest
  test "streams index and show pages work" do
  	visit "/"

  	assert page.has_content? "What do you want to know more about?"
  	assert find('.streams-container').has_link? "Ruby on Rails"

  	click_link "Ruby on Rails"
  	assert_equal "/streams/1", current_path
  	assert find('.topic-container').has_content? "HTML"
  end
end
