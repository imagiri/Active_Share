class CommentsController < ApplicationController

  def create
   @diary = Diary.find(params[:diary_id])
   @comment = @diary.comments.build(comment_params)
   respond_to do |format|
     if @comment.save
       format.js { render :index }
     else
       format.html { redirect_to blog_path(@diary), notice: '投稿できませんでした...' }
     end
   end
end

  private
  def comment_params
    params.require(:comment).permit(:diary_id, :content)
  end
end
