class LearningPath < ActiveRecord::Base
	# associations
  belongs_to :user
  has_many :nodes

  # validations

  # call backs
end
