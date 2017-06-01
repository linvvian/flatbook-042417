class EventsController < ApplicationController
  before_action :logged_in
  before_action :find_event, except: [:index, :new, :create]
  before_action :logged_creator, only: [:edit, :update, :destroy]
  helper_method :is_member?, :is_creator?

  def index
    @events = Event.all.order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    @event.users << current_user
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

  def is_member?
    @event.users.include?(current_user)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :description, :creator_id, :time)
  end

  def is_creator?
    @event.creator == current_user
  end

  def logged_creator
    redirect_to event_path(@event) unless is_creator? || is_admin?
  end

end
