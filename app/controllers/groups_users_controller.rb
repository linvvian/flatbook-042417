class GroupsUsersController < GroupsController

  def join_group
    @group.users << current_user
    redirect_to group_path(@group)
  end

  def leave_group
    @group.users.delete(current_user)
    redirect_to group_path(@group)
  end

end
