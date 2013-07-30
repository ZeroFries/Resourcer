class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.text :summary
      t.string :image_url
      t.integer :price
      t.string :category

      t.timestamps
    end
  end
end
