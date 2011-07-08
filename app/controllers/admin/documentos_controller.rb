class Admin::DocumentosController < ApplicationController
  before_filter :load_edital

  # GET /admin/documentos/new
  # GET /admin/documentos/new.xml
  def new
    @documento = @edital.documentos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /admin/documentos/1/edit
  def edit
    @documento = @edital.documentos.find(params[:id])
  end

  # POST /admin/documentos
  # POST /admin/documentos.xml
  def create
    @documento = Documento.new(params[:documento])

    respond_to do |format|
      if @documento.save
        format.html { redirect_to(admin_edital_url(@edital), :notice => 'Documento was successfully created.') }
        format.xml  { render :xml => @documento, :status => :created, :location => @documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/documentos/1
  # PUT /admin/documentos/1.xml
  def update
    @documento = @edital.documentos.find(params[:id])

    respond_to do |format|
      if @documento.update_attributes(params[:documento])
        format.html { redirect_to(admin_edital_url(@edital), :notice => 'Documento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/documentos/1
  # DELETE /admin/documentos/1.xml
  def destroy
    @documento = @edital.documentos.find(params[:id])
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to(admin_edital_url(@edital)) }
      format.xml  { head :ok }
    end
  end

  protected
  def load_edital
    @edital = Edital.find(params[:edital_id])
  end
end
