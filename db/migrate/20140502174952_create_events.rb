class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :image
      t.date :month

      t.timestamps
    end
  end
end
