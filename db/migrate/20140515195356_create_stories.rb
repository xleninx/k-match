class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :autor
      t.date :year
      t.timestamps
    end
  end
end
