class AddAdminApprovedToSource < ActiveRecord::Migration
  def change
    add_column :sources, :admin_approved?, :boolean
  end
end
