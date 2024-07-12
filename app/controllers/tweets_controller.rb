class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    render 'tweets/index'
  end

  def create
    token = cookies.signed[:twitter_session_token]
    session = Session.find_by(token: token)
    user = session.user
    @tweet = user.tweets.new(tweet_params)

    if @tweet.save
      TweetMailer.notify(@tweet).deliver! # invoke TweetMailer to send out the email
      tweet_response = {
        username: @tweet.user.username,
        message: @tweet.message
      }
      if @tweet.image.attached?
        tweet_response[:image] = { url: url_for(@tweet.image) } # Add image URL if attached
      end

      render json: { tweet: tweet_response }, status: :created # Return 201 Created status
    else
      render json: { errors: @tweet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    token = cookies.signed[:twitter_session_token]
    session = Session.find_by(token: token)
    return render json: { success: false } unless session

    user = session.user
    tweet = Tweet.find_by(id: params[:id])

    if tweet && (tweet.user == user) && tweet.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def index_by_user
    user = User.find_by(username: params[:username])

    if user
      @tweets = user.tweets
      render 'tweets/index'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message, :image) # Permit :image along with :message
  end
end

