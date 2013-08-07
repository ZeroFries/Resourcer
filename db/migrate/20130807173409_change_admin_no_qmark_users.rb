class ChangeAdminNoQmarkUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :admin?, :admin
  end
end
