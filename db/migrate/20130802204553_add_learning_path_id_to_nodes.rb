class AddLearningPathIdToNodes < ActiveRecord::Migration
  def change
    add_reference :nodes, :learning_path, index: true
  end
end
