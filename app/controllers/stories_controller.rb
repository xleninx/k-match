class StoriesController < ApplicationController

  def index
    @stories = Story.random_stories(5)
  end

end