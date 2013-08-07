require 'test_helper'

class TopicsFlowTest < ActionDispatch::IntegrationTest
  test "topics index and show pages work" do
  	visit "/"

  	assert page.has_content? "What do you want to know more about?"
  	assert find('.topics-container').has_link? "HTML"

  	find('.topic').click_link "HTML"
  	assert_equal topics_path(Topic.where(name: "HTML").first, current_path
  	assert find('.skills-container').has_content? "Beginner"
  end

  test "users can submit a new resource" do
  	visit topic_path(Topic.first)

  	assert find('.skills-container').find('.new-source-wrapper').has_link? "Add a new resource"
  	find('.skills-container').find('.new-source-wrapper').click_link? "Add a new resource"

  	fill_in "source[name]", with: "Google"
  	fill_in "source[url]", with: "google.com"
  	click_button "Submit resource"

  	assert page.has_content? "Thanks for submitting a resource!"
  end
end
