class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :topic, index: true
      t.references :skill, index: true
      t.string :state

      t.timestamps
    end
  end
end
