class IndustriesController < ApplicationController

  def index
    @industries = Industry.all
  end

  def show
    @industry = Industry.find_by(id: params[:id])
  end

  def new
  end

  def create
    @industry = Industry.new
    @industry.name = params[:name]

    if @industry.save
      redirect_to industries_url, notice: "Industry created successfully."
    else
      render 'new'
    end
  end

  def edit
    @industry = Industry.find_by(id: params[:id])
  end

  def update
    @industry = Industry.find_by(id: params[:id])
    @industry.name = params[:name]

    if @industry.save
      redirect_to industries_url, notice: "Industry updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @industry = Industry.find_by(id: params[:id])
    @industry.destroy

    redirect_to industries_url, notice: "Industry deleted."
  end
end
