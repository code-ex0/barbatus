class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :tweets
  has_many :favorites


  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"

  has_many :followees, through: :followed_users, source: :followee

  has_many :follower_users, foreign_key: :followed_id, class_name: "Following"

  has_many :folowers, through: :follower_users, source: :follower
end
