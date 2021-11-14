class FavoritesController < ApplicationController

  def create
    music_image = MusicImage.find(params[:music_image_id])
    favorite = current_user.favorites.new(music_image_id: music_image.id)
    favorite.save
    redirect_to music_image_path(music_image)
  end

  def destroy
    music_image = MusicImage.find(params[:music_image_id])
    favorite = current_user.favorites.find_by(music_image_id: music_image.id)
    favorite.destroy
    redirect_to music_image_path(music_image)
  end

end
