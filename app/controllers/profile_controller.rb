class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end
end
