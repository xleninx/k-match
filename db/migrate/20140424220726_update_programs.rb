class UpdatePrograms < ActiveRecord::Migration
  def up
    User.all.each do |user|
      user.program_ids = [user.program_id]
      user.save!
    end
  end

  def down
  end
end
