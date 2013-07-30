class Topic < ActiveRecord::Base
	# properties: name

	# associations
	has_many :join_stream_topics
	has_many :streams, through: :join_stream_topics
	has_many :skills
	has_many :sources, through: :skills
end
