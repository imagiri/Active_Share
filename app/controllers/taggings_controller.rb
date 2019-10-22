class TaggingsController < ApplicationController

  def create


  end

  private

  def tags_params
  params.require(:tagging).permit(:tag_name)
  end

end
