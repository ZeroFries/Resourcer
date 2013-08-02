class Topic < ActiveRecord::Base
	# properties: name, description

	# associations
	has_many :join_stream_topics
	has_many :streams, through: :join_stream_topics
	has_many :skills
	has_many :sources, through: :skills

	# validations
	validates :name, :description, presence: true

	# callbacks

	# custom methods
	def skillz_hash
		hash = {}
		self.skills.each do |skill|
			hash[skill.name] = [] if hash[skill.name].nil?
			# access sources by skill name
			hash[skill.name] << Source.find(skill.source_id)
		end
		hash
	end
end
