class ChangeTypeToVideos < ActiveRecord::Migration
  def change
    remove_column(:videos, :type, :integer)
    add_column(:videos, :position, :integer)
  end
end
