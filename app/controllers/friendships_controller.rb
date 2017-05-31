class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      friend = User.find(params[:friend_id])
      friend.friendships.build(:friend_id => current_user.id)
      friend.save
      redirect_to friend
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    friend = User.find(params[:id])
    current_user.friends.delete(friend)
    friend.friends.delete(current_user)
    flash[:notice] = "Removed friend."
    redirect_to friend
  end

  def show
    @friends = current_user.friends
  end
end
