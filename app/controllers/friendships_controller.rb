class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      @friendship.create_activity :create, owner: current_user
      flash[:success] = "Sent request"
      @friendship.update(status: "pending")
      friend = User.find(params[:friend_id])
      redirect_to friend
    else
      flash[:warning] = "Unable to add friend"
      redirect_to root_url
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
