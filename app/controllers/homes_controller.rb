class HomesController < ApplicationController

  def index
    @homes = Home.all
    if current_user.contact_count != nil
    else
      HomeMailer.registration_confirmation(current_user).deliver
      current_user.contact_count = 0
      current_user.save
    end
  end

  def show
    @home = Home.find_by(id: params[:id])
  end

  def new
  end

  def create
    @home = Home.new

    if @home.save
      redirect_to homes_url, notice: "Home created successfully."
    else
      render 'new'
    end
  end

  def edit
    @home = Home.find_by(id: params[:id])
  end

  def update
    @home = Home.find_by(id: params[:id])

    if @home.save
      redirect_to homes_url, notice: "Home updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @home = Home.find_by(id: params[:id])
    @home.destroy

    redirect_to homes_url, notice: "Home deleted."
  end
end
