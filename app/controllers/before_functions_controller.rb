class BeforeFunctionsController < ApplicationController

  def index
    @before_functions = BeforeFunction.all
  end

  def show
    @before_function = BeforeFunction.find_by(id: params[:id])
  end

  def new
  end

  def create
    @before_function = BeforeFunction.new
    @before_function.user_id = params[:user_id]
    @before_function.function_id = params[:function_id]

    if @before_function.save
      redirect_to before_functions_url, notice: "Before function created successfully."
    else
      render 'new'
    end
  end

  def edit
    @before_function = BeforeFunction.find_by(id: params[:id])
  end

  def update
    @before_function = BeforeFunction.find_by(id: params[:id])
    @before_function.user_id = params[:user_id]
    @before_function.function_id = params[:function_id]

    if @before_function.save
      redirect_to before_functions_url, notice: "Before function updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @before_function = BeforeFunction.find_by(id: params[:id])
    @before_function.destroy

    redirect_to before_functions_url, notice: "Before function deleted."
  end
end
