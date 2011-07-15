class Admin::ConfiguracoesController < Admin::BaseController
  set_tab :alterar_senha

  def editar_senha
  end

  def alterar_senha
    password_params = params[:user].slice('password', 'password_confirmation', 'current_password').symbolize_keys
    if current_user.update_password(password_params)
      sign_in current_user, :bypass => true

      flash[:notice] = "Senha atualizada com sucesso!"
      redirect_to admin_editar_senha_url
    else
      render :editar_senha
    end
  end
end
