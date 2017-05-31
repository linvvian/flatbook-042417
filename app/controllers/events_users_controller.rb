class EventsUsersController < GroupsController

  def join_event
    @event.users << current_user
    redirect_to event_path(@event)
  end

  def leave_event
    @event.users.delete(current_user)
    redirect_to event_path(@event)
  end

end
