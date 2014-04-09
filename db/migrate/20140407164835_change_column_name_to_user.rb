class ChangeColumnNameToUser < ActiveRecord::Migration
  def change
    rename_column :users, :class, :grad_year
  end
end
