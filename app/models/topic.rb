class Topic < ActiveRecord::Base
	# properties: name

	# associations
	has_many :join_stream_topics
	has_many :streams, through: :join_stream_topics
	has_many :skills
	has_many :sources, through: :skills

	def skillz_hash
		hash = {}
		self.skills.each do |skill|
			hash[skill.name] = [] if hash[skill.name].nil?
			hash[skill.name] << Source.find(skill.source_id)
		end
		hash
	end
end
