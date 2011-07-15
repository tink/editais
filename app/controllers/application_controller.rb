class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid, :with => :render_404
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ActionController::UnknownAction, :with => :render_404

  helper_method :current_empresa

  protect_from_forgery

  protected
  def current_empresa
    if session[:empresa_id]
      @empresa ||= Empresa.find(session[:empresa_id])
    end
  end

  def render_404
    respond_to do |type| 
      type.html { render :template => "errors/404", :layout => 'base', :status => 404 } 
      type.all  { render :nothing => true, :status => 404 } 
    end
    true
  end
end
