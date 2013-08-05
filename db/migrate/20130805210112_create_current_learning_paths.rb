class CreateCurrentLearningPaths < ActiveRecord::Migration
  def change
    create_table :current_learning_paths do |t|
      t.references :user, index: true
      t.references :learning_path, index: true

      t.timestamps
    end
  end
end
