class EditaisController < ApplicationController
  before_filter :verificar_empresa, :only => :show

  # GET /editais
  # GET /editais.xml
  def index
    @em_aberto = Edital.em_aberto
    @recentemente_finalizados = Edital.recentemente_finalizados

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editais }
    end
  end

  # GET /editais/1
  # GET /editais/1.xml
  def show
    @edital = Edital.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @edital }
    end
  end

  protected
  def verificar_empresa
    unless current_empresa
      redirect_to autenticar_empresas_url(:e => params[:id])
    end
  end
end
