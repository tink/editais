# encoding: UTF-8

class EmpresasController < ApplicationController
  before_filter :load_edital, :except => [:autenticar, :verificar]

  # GET /empresas/autenticar
  def autenticar
    session.delete(:empresa_id)
  end

  # POST /empresas/verificar
  def verificar
    if !Cnpj.new(params[:cnpj]).valido?
      flash[:error] = 'CNPJ informado não é válido'
      redirect_to :action => :autenticar, :e => params[:e]
    else
      if empresa = Empresa.find_by_cnpj(params[:cnpj])
        liberar_acesso(empresa)
        if params[:e]
          redirect_to edital_url(params[:e])
        else
          redirect_to editais_url
        end
      else
        redirect_to params.slice(:e, :cnpj).merge(:action => :new)
      end
    end
  end

  # GET /empresas/new
  # GET /empresas/new.xml
  def new
    @empresa = Empresa.new(:cnpj => params[:cnpj])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @empresa }
    end
  end

  # POST /empresas
  # POST /empresas.xml
  def create
    @empresa = Empresa.new(params[:empresa])

    respond_to do |format|
      if @empresa.save
        liberar_acesso(@empresa)

        format.html { redirect_to(@edital, :notice => 'Empresa criada com sucesso!') }
        format.xml  { render :xml => @empresa, :status => :created, :location => @empresa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @empresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected
  def liberar_acesso(empresa)
    session[:empresa_id] = empresa.id
  end

  def load_edital
    @edital = Edital.find(params[:e])
  end
end
