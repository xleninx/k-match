class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(id: params[:id])
  end

  def new
  end

  def create
    @country = Country.new
    @country.code = params[:code]
    @country.name = params[:name]

    if @country.save
      redirect_to countries_url, notice: "Country created successfully."
    else
      render 'new'
    end
  end

  def edit
    @country = Country.find_by(id: params[:id])
  end

  def update
    @country = Country.find_by(id: params[:id])
    @country.code = params[:code]
    @country.name = params[:name]

    if @country.save
      redirect_to countries_url, notice: "Country updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @country = Country.find_by(id: params[:id])
    @country.destroy

    redirect_to countries_url, notice: "Country deleted."
  end
end
