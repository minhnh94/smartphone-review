class UsersController < ApplicationController
  before_action :load_user, only: [:show]

  def show
  @reviews = @user.reviews
  @total = @user.reviews.count
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
  end
end
