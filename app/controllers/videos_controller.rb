class VideosController < ApplicationController
  skip_before_filter :authenticate_user!, :all
  def index
    @main_video = Video.main_video
    @videos = Video.random_secondaries(3)
  end

end