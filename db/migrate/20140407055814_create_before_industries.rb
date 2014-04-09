class CreateBeforeIndustries < ActiveRecord::Migration
  def change
    create_table :before_industries do |t|
      t.integer :user_id
      t.integer :industry_id
    end
  end
end
