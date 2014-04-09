class BeforeIndustriesController < ApplicationController

  def index
    @before_industries = BeforeIndustry.all
  end

  def show
    @before_industry = BeforeIndustry.find_by(id: params[:id])
  end

  def new
  end

  def create
    @before_industry = BeforeIndustry.new
    @before_industry.user_id = params[:user_id]
    @before_industry.industry_id = params[:industry_id]

    if @before_industry.save
      redirect_to before_industries_url, notice: "Before industry created successfully."
    else
      render 'new'
    end
  end

  def edit
    @before_industry = BeforeIndustry.find_by(id: params[:id])
  end

  def update
    @before_industry = BeforeIndustry.find_by(id: params[:id])
    @before_industry.user_id = params[:user_id]
    @before_industry.industry_id = params[:industry_id]

    if @before_industry.save
      redirect_to before_industries_url, notice: "Before industry updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @before_industry = BeforeIndustry.find_by(id: params[:id])
    @before_industry.destroy

    redirect_to before_industries_url, notice: "Before industry deleted."
  end
end
