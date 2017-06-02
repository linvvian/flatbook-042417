class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.status = "pending"
    if @friendship.save
      flash[:success] = "Sent request"
      friend = User.find(params[:friend_id])
      redirect_to friend
    end
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to show_friends_path
  end

  def show

  end

  # confirm friendship
  def update
    friendship = Friendship.find(params[:id])
    friendship.update(status: "friend")
    redirect_to show_friends_path
  end

end
