class UsersController < ApplicationController
  #ユーザーのデータを1件取得し、インスタンス変数へ渡す。
  #kaminariのpageメソッドを使用
  def show
    @user = User.find(params[:id])
    @music_images = @user.music_images.page(params[:page]).reverse_order
  end
  
  #編集用viewでform_withを使用するためparams[:id]でユーザ情報を取得して@userに保存し
  def edit
    @user = User.find(params[:id])
  end
  
end