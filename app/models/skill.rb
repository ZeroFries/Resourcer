class Skill < ActiveRecord::Base
	belongs_to :topic
  belongs_to :source
end
