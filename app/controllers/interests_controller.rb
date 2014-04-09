class InterestsController < ApplicationController

  def index
    @interests = Interest.all
  end

  def show
    @interest = Interest.find_by(id: params[:id])
  end

  def new
  end

  def create
    @interest = Interest.new
    @interest.name = params[:name]

    if @interest.save
      redirect_to interests_url, notice: "Interest created successfully."
    else
      render 'new'
    end
  end

  def edit
    @interest = Interest.find_by(id: params[:id])
  end

  def update
    @interest = Interest.find_by(id: params[:id])
    @interest.name = params[:name]

    if @interest.save
      redirect_to interests_url, notice: "Interest updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @interest = Interest.find_by(id: params[:id])
    @interest.destroy

    redirect_to interests_url, notice: "Interest deleted."
  end
end
