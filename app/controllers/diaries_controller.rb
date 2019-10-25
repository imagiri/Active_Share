class DiariesController < ApplicationController
before_action :set_diary, only: [:show, :edit, :destroy, :update]
protect_from_forgery :except => [:create]


  def new
    @diary = Diary.new
    @diary.tags.build

    # @image = @diary.images.builds

  end

  def create
    @diary = current_user.diaries.build(diaries_params)

    # @image = @diary.images.build(images_params)

    tag_list = params[:tag_list].split(",")
    if @diary.save
      # @image.save(images_params)
      @diary.save_tags(tag_list)
      flash[:success] = "活動記録を投稿しました"
      redirect_to diaries_url
    else
      render 'diaries/new'
    end
  end

  def show
    @tag_list = @diary.tags.pluck(:tag_name)
    @comments = @diary.comments
    @comment = @diary.comments.build
    @image = Image.find_by(diary_id: @diary.id )
    @favorite = current_user.favorites.find_by(diary_id: @diary.id)
  end

  def edit
    @tag_list = @diary.tags.pluck(:tag_name).join(",")
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: "活動日記を削除しました"
  end

  def update
    tag_list = params[:tag_list].split(",")
    if @diary.update_attributes(diaries_params)
      @diary.save_tags(tag_list)
      flash[:success] = "日記を編集しました"
      redirect_to diaries_url
    else
      render 'edit'
    end
  end

  def index
    @search = Diary.includes(:user).references(:user).ransack(params[:q])
    if params[:q]
      @diaries = Diary.page(params[:page]).ransack(params[:q]).result
    else
      @diaries = Diary.page(params[:page])
    end
  end

  def top
    render :layout => nil
  end

  private
  def diaries_params
    params.require(:diary).permit(:content, :title, :activity_date, :main_image, :user_id, {sub_image: []})
  end

  # def images_params
  #   params.require(:image).permit(:main_image, :memo, :diary_id, { :sub_image=> [] })
  # end

  def set_diary
    @diary = Diary.find(params[:id])
  end

end
