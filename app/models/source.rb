class Source < ActiveRecord::Base
	# properties: name, url, type (ex article, book), summary, image_url, price (1 -> $)

	# associations
	has_many :skills
	has_many :topics, through: :skills
	has_many :requirements
	has_many :nodes, through: :requirements
	has_many :learning_paths, through: :nodes

	# validations
	validates :name, :summary, :category, presence: true
	validates :url, presence: true, uniqueness: { case_sensitive: false }
	validates :price, presence: true, inclusion: (0..4)

	# call backs
end
