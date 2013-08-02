class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.references :node, index: true
      t.integer :completed
      t.integer :goal
      t.string :state

      t.timestamps
    end
  end
end
