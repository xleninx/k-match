class CreateAfterFunctions < ActiveRecord::Migration
  def change
    create_table :after_functions do |t|
      t.integer :user_id
      t.integer :function_id
    end
  end
end
