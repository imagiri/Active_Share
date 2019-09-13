class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def show
  end

  def edit
  end

  def destroy
  end

  def update
    if @user.save(user_params)
      redirect_to user_path(current_user.id), notice: "ユーザー情報を変更しました"
    else
      flash.now[:alert] = "ユーザー情報の更新に失敗しました"
      render "edit"
    end
  end

  def index
    @search = User.ransack(params[:q])
    if params[:q]
      @users = User.page(params[:page]).ransack(params[:q]).result
    else
      @users = User.page(params[:page])
  end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :icon, :back_icon, :introduction, :sex, :age, :activity_area, :birth_place, :outdoor_history)
  end


end
