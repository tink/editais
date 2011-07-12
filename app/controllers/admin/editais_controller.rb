class Admin::EditaisController < Admin::BaseController
  # GET /admin/editais
  # GET /admin/editais.xml
  def index
    @editais = Edital.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editais }
    end
  end

  # GET /admin/editais/1
  # GET /admin/editais/1.xml
  def show
    @edital = Edital.find(params[:id])

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
    @edital = Edital.find(params[:id])
  end

  # POST /admin/editais
  # POST /admin/editais.xml
  def create
    @edital = Edital.new(params[:edital])

    respond_to do |format|
      if @edital.save
        format.html { redirect_to(admin_edital_url(@edital), :notice => 'Edital was successfully created.') }
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
    @edital = Edital.find(params[:id])

    respond_to do |format|
      if @edital.update_attributes(params[:edital])
        format.html { redirect_to(admin_edital_url(@edital), :notice => 'Edital was successfully updated.') }
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
    @edital = Edital.find(params[:id])
    @edital.destroy

    respond_to do |format|
      format.html { redirect_to(admin_editais_url) }
      format.xml  { head :ok }
    end
  end
end
