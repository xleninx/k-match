class StoriesController < ApplicationController
  skip_before_filter :authenticate_user!, :all
  def index
    @stories = Story.random_stories(5)
  end

end