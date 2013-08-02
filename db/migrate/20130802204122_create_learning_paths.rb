class CreateLearningPaths < ActiveRecord::Migration
  def change
    create_table :learning_paths do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
