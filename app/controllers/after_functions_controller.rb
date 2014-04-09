class AfterFunctionsController < ApplicationController

  def index
    @after_functions = AfterFunction.all
  end

  def show
    @after_function = AfterFunction.find_by(id: params[:id])
  end

  def new
  end

  def create
    @after_function = AfterFunction.new
    @after_function.user_id = params[:user_id]
    @after_function.function_id = params[:function_id]

    if @after_function.save
      redirect_to after_functions_url, notice: "After function created successfully."
    else
      render 'new'
    end
  end

  def edit
    @after_function = AfterFunction.find_by(id: params[:id])
  end

  def update
    @after_function = AfterFunction.find_by(id: params[:id])
    @after_function.user_id = params[:user_id]
    @after_function.function_id = params[:function_id]

    if @after_function.save
      redirect_to after_functions_url, notice: "After function updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @after_function = AfterFunction.find_by(id: params[:id])
    @after_function.destroy

    redirect_to after_functions_url, notice: "After function deleted."
  end
end
