class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user
    if current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/users/sign_in")
    end
  end
  
  def forbid_login_user
    if current_user.present?
      flash[:notice] = "すでにログインしています"
      redirect_to("/items/index")
    end
  end

  private

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation, :image ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
