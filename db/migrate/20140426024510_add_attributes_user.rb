class AddAttributesUser < ActiveRecord::Migration
  def change
    add_column :users, :before_industry_id, :integer
    add_column :users, :after_industry_id, :integer
    add_column :users, :before_function_id, :integer
    add_column :users, :after_function_id, :integer
  end
end
