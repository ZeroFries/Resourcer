class NodesDontHaveAState < ActiveRecord::Migration
  def change
  	remove_column :nodes, :state
  end
end
