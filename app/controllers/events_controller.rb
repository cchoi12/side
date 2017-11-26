class EventsController < ApplicationController
  before_action :set_time, only: [:index]
  before_action :set_event, only: [:show]
  before_action :set_events, only: [:index]

  def index
  end

  def show
  end

  private

  def set_time
    @time = Time.now.strftime('%A, %b %d')
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_events
    @events = Event.all
  end
end
