class TagsController < ApplicationController

  def create
    @tag = Tag.new(tags_params)
    if @tag.save

  end

  def destroy

  end

  private

  def tags_params
  params.require(:tag).permit(:tag_name)
  end
end
