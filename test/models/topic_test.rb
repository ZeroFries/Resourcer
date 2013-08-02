require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
  	@topic = FactoryGirl.create :topic
  end

  test "topics have names" do
  	@topic.name = ""

  	assert !@topic.save
  end

  test "topics have descriptions" do
  	@topic.description = ""

  	assert !@topic.save
  end

  test "topics have skills" do
  	@topic.skills.create name: "Advanced", source: (FactoryGirl.create :source)

  	assert_equal @topic.skills.count, 1
  end
end
