class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :right
      t.integer :country_id
      t.integer :program_id
      t.integer :class
      t.integer :contact_count
    end
  end
end
