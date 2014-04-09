class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find_by(id: params[:id])
  end

  def new
  end

  def create
    @program = Program.new
    @program.name = params[:name]

    if @program.save
      redirect_to programs_url, notice: "Program created successfully."
    else
      render 'new'
    end
  end

  def edit
    @program = Program.find_by(id: params[:id])
  end

  def update
    @program = Program.find_by(id: params[:id])
    @program.name = params[:name]

    if @program.save
      redirect_to programs_url, notice: "Program updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @program = Program.find_by(id: params[:id])
    @program.destroy

    redirect_to programs_url, notice: "Program deleted."
  end
end
