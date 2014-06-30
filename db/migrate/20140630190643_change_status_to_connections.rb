class ChangeStatusToConnections < ActiveRecord::Migration
  def change
    change_column :connections, :message, :text
  end
end
