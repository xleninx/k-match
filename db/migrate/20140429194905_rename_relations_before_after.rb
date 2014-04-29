class RenameRelationsBeforeAfter < ActiveRecord::Migration
  def change
    rename_column :users,:before_industry_id, :current_industry_id
    rename_column :users,:after_industry_id, :interest_industry_id
    rename_column :users,:before_function_id, :current_function_id
    rename_column :users,:after_function_id, :interest_function_id
    rename_column :interests_users,:interest_id, :club_id
    rename_table :interests, :clubs
    rename_table :interests_users, :clubs_users
  end
end
