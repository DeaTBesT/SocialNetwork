class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    if user == current_user
      redirect_back(fallback_location: request.referer || "/", alert: "Вы не можете подписаться на самого себя")
      return
    end

    if current_user.following.include?(user)
      redirect_back(fallback_location: request.referer || "/", notice: "Вы уже подписаны на #{user.email}")
    else
      current_user.following << user
      redirect_back(fallback_location: request.referer || "/", notice: "Вы подписались на #{user.email}")
    end
  end

  def destroy
    subscription = current_user.active_subscriptions.find_by(followed_id: params[:user_id])
    if subscription
      subscription.destroy
      redirect_back(fallback_location: request.referer || "/", notice: "Вы отписались от #{subscription.followed.email}")
    else
      redirect_back(fallback_location: request.referer || "/", alert: "Подписка не найдена")
    end
  end
end
