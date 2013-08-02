class User < ActiveRecord::Base
	# associations
	has_many :bookmarks
	has_many :sources, through: :bookmarks
	has_many :learning_paths
	
	# validations
	has_secure_password
	valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :email, presence: true, format: { with: valid_email }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 5 }, on: :create

	before_create { |user| user.email.downcase! }
end
