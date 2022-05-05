class PagesController < ApplicationController
  # skip_before_action :authenticate_user! , only: [:home]

  def home
    @tweet = Tweet.new
    @user = current_user
    if current_user.nil?
      @tweets = Tweet.all.order("created_at")[0..20]
    else
      @tweets = []
      current_user.followees.each do |follower|
        follower.tweets[0..5].each do |tweet|
          @tweets << tweet
        end
      end
      @tweets = @tweets.sort_by { |tweet| tweet.created_at}.reverse!
    end
  end
end