class ApplicationController < ActionController::Base

  #configure~ → deviceで利用できるパラメーターを設定しますよという意味
  #before_action　→ 全てのコントローラーの実行前にアクションさせる
  #:devise_controller? → もしそれがdeviseのコントローラーだったら（devise_controller?というメソッドの返り値がtrueだったら）configure_permitted_parametersを呼ぶ。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #ここの記述ではデバイス版のストロングパラメーター。
  #デバイスでは初期設定でメールアドレスとパスワードしか許されていない。
  #ここを編集することでユーザーネームなどを入れることができる。
  #今回の例だとnameカラムへの保存を許可する。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
