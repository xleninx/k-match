class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def month
    @month = params[:month].to_i
    @event = Event.where("month = ?", Date::MONTHNAMES[@month])
    render 'index'
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

end
