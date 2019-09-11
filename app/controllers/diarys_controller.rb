class DiarysController < ApplicationController
  def new
    @diarys = Diarys.new
  end

  def create
    @diarys = current_user.diarys.build(diarys_params)
    if @diarys.save
      redirect_to diarys_path, notice: "新規の活動日記を投稿しました"
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
    @diarys = Diarys.all
  end

  def top
    render :layout => nil
  end

  private
  def diarys_params
    params.require(:diarys).permit(:content, :title, :activity_date, :user_id)
  end
end
