class LearningPath < ActiveRecord::Base
	# associations
  belongs_to :user
  has_many :nodes, dependent: :destroy
  has_many :requirements, through: :nodes
  has_many :sources, through: :requirements

  # validations

  # call backs
end
