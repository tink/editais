class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  protected
  def current_instituicao
    @current_instituicao ||= current_user.try(:instituicao)
  end
end
