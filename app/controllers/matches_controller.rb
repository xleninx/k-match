class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find_by(id: params[:id])
  end

  def new
  end

  def create
    @match = Match.new
    @match.match_index = params[:match_index]
    @match.user_id = params[:user_id]

    if @match.save
      redirect_to matches_url, notice: "Match created successfully."
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find_by(id: params[:id])
  end

  def update
    @match = Match.find_by(id: params[:id])
    @match.match_index = params[:match_index]
    @match.user_id = params[:user_id]

    if @match.save
      redirect_to matches_url, notice: "Match updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @match = Match.find_by(id: params[:id])
    @match.destroy

    redirect_to matches_url, notice: "Match deleted."
  end
end
