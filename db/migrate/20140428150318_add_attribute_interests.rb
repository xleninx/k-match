class AddAttributeInterests < ActiveRecord::Migration
  def change
    add_column :interests, :type_club, :string
  end
end
