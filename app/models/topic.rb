class Topic < ActiveRecord::Base
	# properties: name, description

	# associations
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
			unless skill.source_id.nil?
				hash[skill.name] = [] if hash[skill.name].nil?
				# access sources by skill name
				source = Source.find(skill.source_id)
				hash[skill.name] << source if source.admin_approved?
			end
		end
		hash
	end
end
