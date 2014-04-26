class FixModels < ActiveRecord::Migration
  def change
    drop_table :before_industries
    drop_table :before_functions
    drop_table :after_industries
    drop_table :after_functions
    rename_table :preferences, :interests_users
  end
end
