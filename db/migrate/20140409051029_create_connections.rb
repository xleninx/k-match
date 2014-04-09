class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :student_id
      t.integer :prospective_id
      t.boolean :status

      t.timestamps
    end
  end
end
