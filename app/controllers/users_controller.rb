# class UsersController < ApplicationController

#   def show
#     @nickname = current_user.nickname

#     # アソシエーションなし
#     # @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")

#     # アソシエーションあり
#     @tweets = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")
#   end
# end


class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end
end