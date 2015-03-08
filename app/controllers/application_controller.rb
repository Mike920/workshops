class ApplicationController < ActionController::Base
  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception
end
