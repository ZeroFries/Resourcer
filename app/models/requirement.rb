class Requirement < ActiveRecord::Base
	# associations
  belongs_to :node
  belongs_to :source

  # call backs
end
