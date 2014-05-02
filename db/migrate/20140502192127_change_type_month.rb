class ChangeTypeMonth < ActiveRecord::Migration
  def change
    change_column :events, :month,  :string
  end
end
