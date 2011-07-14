class Admin::EditaisController < Admin::BaseController
  set_tab :editais

  # GET /admin/editais
  # GET /admin/editais.xml
  def index
    @editais = current_instituicao.editais.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editais }
    end
  end

  # GET /admin/editais/1
  # GET /admin/editais/1.xml
  def show
    @edital = current_instituicao.editais.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @edital }
    end
  end

  # GET /admin/editais/new
  # GET /admin/editais/new.xml
  def new
    @edital = Edital.new
    @edital.documentos.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @edital }
    end
  end

  # GET /admin/editais/1/admin/edit
  def edit
    @edital = current_instituicao.editais.find(params[:id])
  end

  # POST /admin/editais
  # POST /admin/editais.xml
  def create
    @edital = current_instituicao.editais.new(params[:edital])

    respond_to do |format|
      if @edital.save
        format.html { redirect_to(admin_edital_url(@edital), :notice => 'Edital criado com sucesso.') }
        format.xml  { render :xml => @edital, :status => :created, :location => @edital }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @edital.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/editais/1
  # PUT /admin/editais/1.xml
  def update
    @edital = current_instituicao.editais.find(params[:id])

    respond_to do |format|
      if @edital.update_attributes(params[:edital])
        format.html { redirect_to(admin_edital_url(@edital), :notice => 'Edital atualizado com sucesso') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @edital.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/editais/1
  # DELETE /admin/editais/1.xml
  def destroy
    @edital = current_instituicao.editais.find(params[:id])
    @edital.destroy

    respond_to do |format|
      format.html { redirect_to(admin_editais_url) }
      format.xml  { head :ok }
    end
  end
end
