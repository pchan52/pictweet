class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    #allは省略可
    @tweets = Tweet.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    # @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    #nameカラムに name属性(キー)に入力したもの(params[:name])を入れる
    # Tweet.create(name: params[:name], image: params[:image], text: params[:text])
    # Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:image], user_id: current_user.id)
    Tweet.create(image: tweet_params[:image], text: tweet_params[:image], user_id: current_user.id)
  end

  # viewにインスタンスを渡すわけではないので，@をつけなくてok(つけても問題ない)
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  # viewにインスタンスを渡すわけではないので，@をつけなくてok(つけても問題ない)
  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
       tweet.update(tweet_params)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    #name,image,textキーをもつパラメータのみ受付
    # params.permit(:name, :image, :text)
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
