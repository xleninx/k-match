class ChangeEstatusTypeConnections < ActiveRecord::Migration
  def change
    change_column :connections, :status,  :string
  end
end
