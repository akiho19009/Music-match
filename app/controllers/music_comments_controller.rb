class MusicCommentsController < ApplicationController

  def create
    music_image = MusicImage.find(params[:music_image_id])
    comment = current_user.music_comments.new(music_comment_params)
    comment.music_image_id = music_image.id
    comment.save
    redirect_to music_image_path(music_image)
  end

  def destroy
    MusicComment.find_by(id: params[:id]).destroy
    redirect_to music_image_path(params[:music_image_id])
  end


  private

  def music_comment_params
    params.require(:music_comment).permit(:comment)
  end


end
