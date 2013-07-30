class Stream < ActiveRecord::Base
	# properties: name

	# associations
	has_many :join_stream_topics
	has_many :topics, through: :join_stream_topics
end
