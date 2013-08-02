require 'test_helper'

class TopicsFlowTest < ActionDispatch::IntegrationTest
  test "topics index and show pages work" do
  	visit "/"

  	assert page.has_content? "What do you want to know more about?"
  	assert find('.topics-container').has_link? "HTML"

  	find('.topic').click_link "HTML"
  	assert_equal "/topics/1", current_path
  	assert find('.skills-container').has_content? "Beginner"
  end
end
