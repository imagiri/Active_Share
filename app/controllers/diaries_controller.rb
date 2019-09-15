class DiariesController < ApplicationController

  def new
    @diary = Diary.new
    @diary.tags.build
  end

  def create
    @diary = current_user.diaries.build(diaries_params)
    if @diary.save
      redirect_to diaries_path, notice: "新規の活動日記を投稿しました"
    else
      render "new"
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
