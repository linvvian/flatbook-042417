class EventsUsersController < EventsController

  def join_event
    @event = Event.find(params[:id])
    @event.users << current_user
    redirect_to event_path(@event)
  end

  def leave_event
    @event = Event.find(params[:id])
    @event.users.delete(current_user)
    redirect_to event_path(@event)
  end

end
