require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
  	@stream = FactoryGirl.create :stream
  	@topic = FactoryGirl.create :topic
  	@join = JoinStreamTopic.create topic_id: @topic.id, stream_id: @stream.id
  end

  test "topics have streams" do
  	assert @topic.streams.include? @stream
  end
end
