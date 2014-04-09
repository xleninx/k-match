class FunctionsController < ApplicationController

  def index
    @functions = Function.all
  end

  def show
    @function = Function.find_by(id: params[:id])
  end

  def new
  end

  def create
    @function = Function.new
    @function.name = params[:name]

    if @function.save
      redirect_to functions_url, notice: "Function created successfully."
    else
      render 'new'
    end
  end

  def edit
    @function = Function.find_by(id: params[:id])
  end

  def update
    @function = Function.find_by(id: params[:id])
    @function.name = params[:name]

    if @function.save
      redirect_to functions_url, notice: "Function updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @function = Function.find_by(id: params[:id])
    @function.destroy

    redirect_to functions_url, notice: "Function deleted."
  end
end
