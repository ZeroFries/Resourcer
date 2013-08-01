require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
  	@topic = FactoryGirl.create :topic
  	@join = JoinStreamTopic.create topic_id: @topic.id, stream_id: @stream.id
  end
end
