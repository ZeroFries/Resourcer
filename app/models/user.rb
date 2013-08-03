class User < ActiveRecord::Base
	# associations
	has_many :bookmarks
	has_many :sources, through: :bookmarks
	
	# validations
	has_secure_password
	valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :email, presence: true, format: { with: valid_email }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 5 }, on: :create

	# call backs
	before_create do
	  self.email.downcase
	end

	# methods to compute progress on learning paths
	def completed_path_sources(lp)
		# lp == learning_path
		sources = lp.sources
		complete = self.completed_sources
		# return the intersection
		complete & sources
	end

	def completed_path_nodes(lp)
		complete = completed_path_sources(lp)
		complete_nodes = []
		lp.nodes.each do |node|
			# add node if all sources of the node are in the completed sources
			complete_nodes << node if (complete & node.sources) == node.sources
		end
		complete_nodes
	end
end
