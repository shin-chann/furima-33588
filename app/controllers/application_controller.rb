class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :first_name_cc, :last_name_cc, :first_name_kana, :last_name_kana, :birthday]
    )
  end
end
