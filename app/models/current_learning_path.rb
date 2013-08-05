class CurrentLearningPath < ActiveRecord::Base
  belongs_to :user
  belongs_to :learning_path
end
