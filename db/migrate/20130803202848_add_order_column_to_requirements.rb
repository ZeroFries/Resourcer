class AddOrderColumnToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :order, :integer
  end
end
