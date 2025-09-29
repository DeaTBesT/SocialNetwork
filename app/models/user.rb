class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :active_subscriptions, class_name: "Subscription", foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_subscriptions, source: :followed

  has_many :passive_subscriptions, class_name: "Subscription", foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_subscriptions, source: :follower

  has_many :posts, dependent: :destroy
  validates :email, presence: { message: "не может быть пустым" }
  validates :password, presence: { message: "не может быть пустым" }, on: :create
end
