class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :match_index
      t.integer :user_id
    end
  end
end
