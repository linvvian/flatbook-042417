class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.delete
    redirect_to events_path
  end

  private

  def find_group
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :creator_id)
  end
end
