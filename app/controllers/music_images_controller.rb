class MusicImagesController < ApplicationController

  def new
    #インスタンス変数に空のインスタンスを渡して画像の投稿を可能にする
    @music_image = MusicImage.new
  end

  #投稿データの保存
  def create
    #music_image_paramsでフォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェック
    @music_image = MusicImage.new(music_image_params)
    #ログイン中のユーザー情報の取得（deviceのヘルパーメソッド）
    @music_image.user_id = current_user.id
    if @music_image.save
      redirect_to music_images_path
    else
      render :new
    end
  end

  #投稿データの一覧表示
  #kaminari専用のpageメソッドを追加
  def index
    @music_images = MusicImage.page(params[:page]).reverse_order
  end

  def show
    #ルーティングはroutes.rbで定義しているためアクションメソッドのみ
    @music_image = MusicImage.find(params[:id])
    @music_comment = MusicComment.new
  end
  
  def edit
    @music_image = MusicImage.find(params[:id])
  end

  def destroy
    @music_image = MusicImage.find(params[:id])
    @music_image.destroy
    redirect_to music_image_path
  end


  def update
    music_image = MusicImage.find(params[:id])
    music_image.update(music_image_params)
    redirect_to music_image_path(music_image)
  end

  #投稿データのストロングパラメータ
  private

  def music_image_params
    params.require(:music_image).permit(:music_name, :image, :caption)
  end

end
