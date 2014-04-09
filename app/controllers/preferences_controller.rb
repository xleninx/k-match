class PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find_by(id: params[:id])
  end

  def new
  end

  def create
    @preference = Preference.new
    @preference.user_id = params[:user_id]
    @preference.interest_id = params[:interest_id]

    if @preference.save
      redirect_to preferences_url, notice: "Preference created successfully."
    else
      render 'new'
    end
  end

  def edit
    @preference = Preference.find_by(id: params[:id])
  end

  def update
    @preference = Preference.find_by(id: params[:id])
    @preference.user_id = params[:user_id]
    @preference.interest_id = params[:interest_id]

    if @preference.save
      redirect_to preferences_url, notice: "Preference updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @preference = Preference.find_by(id: params[:id])
    @preference.destroy

    redirect_to preferences_url, notice: "Preference deleted."
  end
end
