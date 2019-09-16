class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)
    if @tag.save
      flash.now[:notice] = "タグを登録しました"
      render "new"
    else
      flash.now[:alert] = "タグが登録できませんでした。"
      render "new"
    end
  end

  # def index
  #   @tag = Tag.all
  # end

  def destroy

  end

  private

  def tags_params
  params.require(:tag).permit(:tag_name)
  end
end
