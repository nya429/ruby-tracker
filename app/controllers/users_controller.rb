class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered an empty search"
    else
      @users = User.search(params[:search_param])
      @users = current_user.except_current_user(@users)
      flash.now[:danger] = "No user matches to this criteria" if @users.blank?
    end
    render partial: 'friends/result'
  end

  def add_friend
    @friend = User.find(params[:friend])
    # build no need to write current_user id
    current_user.friendships.build(friend_id: @friend.id)

    if current_user.save
      flash[:success] = "Friend was successfully added"
    else
      flash[:danger] = "Something was wrong"
    end
    redirect_to my_friends_path
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
end
