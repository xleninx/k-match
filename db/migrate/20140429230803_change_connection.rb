class ChangeConnection < ActiveRecord::Migration
  def change
    rename_column :connections, :student_id, :current_id
    rename_column :connections, :prospective_id, :prospective_id
    add_column :connections, :message, :string
    change_column :connections, :status,  :string
  end
end
