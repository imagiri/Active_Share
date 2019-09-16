class DiariesController < ApplicationController

  def new
    @diary = Diary.new
    @diary.tags.build
  end

  def create
    @diary = current_user.diaries.build(diaries_params)
    tag_list = params[:tag_list].split(",")
    if @diary.save
      @diary.save_tags(tag_list)
      flash[:success] = "日記を投稿しました"
      redirect_to diaries_url
    else
      render 'diaries/new'
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def index
    @search = Diary.ransack(params[:q])
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
    params.require(:diary).permit(:content, :title, :activity_date, :user_id)
  end
end
