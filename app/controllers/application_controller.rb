class ApplicationController < ActionController::Base
  helper_method :current_empresa

  protect_from_forgery

  protected
  def current_empresa
    if session[:empresa_id]
      @empresa ||= Empresa.find(session[:empresa_id])
    end
  end
end
