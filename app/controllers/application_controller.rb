class ApplicationController < ActionController::Base
  
  before_action :set_current_user #application.html.erbで変数を使うには各アクション全てに定義が必要なためbefore_actionで全反映されるように
    
  def set_current_user #ログイン中のユーザー
    @current_user = User.find_by(id: session[:user_id])
  end
end
