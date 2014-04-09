class AfterIndustriesController < ApplicationController

  def index
    @after_industries = AfterIndustry.all
  end

  def show
    @after_industry = AfterIndustry.find_by(id: params[:id])
  end

  def new
  end

  def create
    @after_industry = AfterIndustry.new
    @after_industry.user_id = params[:user_id]
    @after_industry.industry_id = params[:industry_id]

    if @after_industry.save
      redirect_to after_industries_url, notice: "After industry created successfully."
    else
      render 'new'
    end
  end

  def edit
    @after_industry = AfterIndustry.find_by(id: params[:id])
  end

  def update
    @after_industry = AfterIndustry.find_by(id: params[:id])
    @after_industry.user_id = params[:user_id]
    @after_industry.industry_id = params[:industry_id]

    if @after_industry.save
      redirect_to after_industries_url, notice: "After industry updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @after_industry = AfterIndustry.find_by(id: params[:id])
    @after_industry.destroy

    redirect_to after_industries_url, notice: "After industry deleted."
  end
end
