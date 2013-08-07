class ChangeAdminNoQmarkSource < ActiveRecord::Migration
  def change
  	rename_column :sources, :admin_approved?, :admin_approved
  end
end
