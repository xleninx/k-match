class VideosController < ApplicationController

  def index
    @main_video = Video.main_video
    @videos = Video.random_secondaries(3)
  end

end