class FavoritesController < ApplicationController
  # before_action :set_diary, only: [:create, :destroy]
  before_action :authenticate_user!
  respond_to? :js

  def create
  @favorite = current_user.favorites.create(diary_id: params[:diary_id])
  @diary = Diary.find(params[:diary_id])
  render 'index.js.erb'
 end

 def destroy
  @favorite = current_user.favorites.find_by(diary_id: params[:id].to_i).destroy
  @diary = Diary.find(params[:id])
  render 'index.js.erb'
 end

  def index
    @user = current_user
    @diary = @user.diaries.all
    @favorite = Favorite.where(user_id: @user.id).all
  end

end
