class ChangeYearToStory < ActiveRecord::Migration
  def change
    remove_column(:stories, :year, :date)
    add_column(:stories, :year, :integer)
  end
end
