class Node < ActiveRecord::Base
	# associations
  belongs_to :topic
  belongs_to :skill
  belongs_to :learning_path
  has_many :requirements
  has_many :sources, through: :requirements

  # validations

  # call backs
end
