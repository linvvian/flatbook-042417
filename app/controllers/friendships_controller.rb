class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    user = User.find(params[:id])
    current_user.friends.delete(user)
    redirect_to user
  end

  def show
    @friends = current_user.friends
  end
end
