class Node < ActiveRecord::Base
  belongs_to :topic
  belongs_to :skill
end
