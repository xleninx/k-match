class ChangeConnection < ActiveRecord::Migration
  def change
    rename_column :connections, :student_id, :current_id
    add_column :connections, :message, :string
  end
end
