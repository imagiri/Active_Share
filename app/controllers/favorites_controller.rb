class FavoritesController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js

  def create
    # @favorite = current_user.favorites.create(diary_id: params[:diary_id])
    @favorite = Favorite.create(user_id: current_user.id, diary_id: params[:diary_id])
  end

  def destroy
    # @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    @favorite = Favorite.find_by(user_id: current_user.id, diary_id: params[:diary_id])
    @favorite.destroy
  end

  def index
    @user = current_user
    @diary = @user.diaries.all
    @favorite = Favorite.where(user_id: @user.id).all
  end
end
