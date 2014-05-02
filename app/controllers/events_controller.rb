class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def month
    @event = Event.where("month = ?", Date::MONTHNAMES[params[:month].to_i]) 
    render 'index'
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

end
