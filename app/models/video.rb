class Video < ActiveRecord::Base
  
  scope :mains, lambda{where(:position => VideoType::MAIN)}
  scope :secondaries, lambda{where(:position => VideoType::SECUNDARY)}

  def self.main_video
    mains.first
  end

  def self.random_secondaries(limit)
    secondaries.order('RANDOM()').take(limit)
  end

end
