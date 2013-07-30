class JoinStreamTopic < ActiveRecord::Base
  belongs_to :stream
  belongs_to :topic
end
