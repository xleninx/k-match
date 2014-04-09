class CreateAfterIndustries < ActiveRecord::Migration
  def change
    create_table :after_industries do |t|
      t.integer :user_id
      t.integer :industry_id
    end
  end
end
