class EventsController < ApplicationController
  before_action :set_time, only: [:index]
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_events, only: [:index]

  def index
  end

  def show
  end

  def edit
  end

  def update
    @event.update!(event_params)

    if @event.save!
      redirect_to event_path(@event)
    else
      redirect_to edit_event_path(@event)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create!(event_params)

    if @event.save!
      redirect_to event_path(@event)
    else
      redirect_to new_event_path, notice: 'Couldn\'t create that, recheck it pls :D'
    end
  end

  def destroy
    @event.delete
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
  end

  def set_time
    @time = Time.now.strftime('%A, %b %d')
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_events
    @events = Event.upcoming
  end
end
