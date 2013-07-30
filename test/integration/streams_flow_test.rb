require 'test_helper'

class StreamsFlowTest < ActionDispatch::IntegrationTest
  test "streams index page" do
  	visit "/"

  	assert page.has_content? "What do you want to know more about?"
  	assert find('.streams-container').has_link? "Ruby on Rails"
  end
end
