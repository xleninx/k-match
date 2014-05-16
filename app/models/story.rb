class Story < ActiveRecord::Base
   mount_uploader :image, ImageUploader
  def self.random_stories(limit)
    order('RANDOM()').take(limit)
  end
end
