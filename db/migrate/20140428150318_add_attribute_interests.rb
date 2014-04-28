class AddAttributeInterests < ActiveRecord::Migration
  def change
    remove_column(:interests, :type, :string)
    add_column :interests, :type_club, :string
  end
end
