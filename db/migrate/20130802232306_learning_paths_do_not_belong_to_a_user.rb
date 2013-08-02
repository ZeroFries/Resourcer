class LearningPathsDoNotBelongToAUser < ActiveRecord::Migration
  def change
  	remove_column :learning_paths, :user_id
  end
end
