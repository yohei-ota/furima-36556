class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new]
  before_action :configure_pemitted_parameters, if: :devise_controller?

  private
  def configure_pemitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :first_name, :last_name,
                       :first_name_kana, :last_name_kana, :birthday])
  end
end
