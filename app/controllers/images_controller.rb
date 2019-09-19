class ImagesController < ApplicationController

  def create
    diary = Diary.find(params[:diary_id])
    image = @diary.images.build(images_params)
      if image.save
        ImagePreviewJob.preview(image)
      else
        redirect_to diary_path(diary), notice: '投稿できませんでした...'
      end
    end

  end

  def destroy
  end

  def index
  end

  private

  def images_params
    params.require(:image).permit(:main_image, :sub_image, :memo, :diary_id)
  end

end
