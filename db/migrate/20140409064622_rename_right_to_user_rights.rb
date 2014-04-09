class RenameRightToUserRights < ActiveRecord::Migration
  def change
    rename_column :users, :right, :user_rights
  end
end
