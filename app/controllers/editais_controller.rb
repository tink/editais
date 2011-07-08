class EditaisController < ApplicationController
  # GET /editais
  # GET /editais.xml
  def index
    @editais = Edital.all

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

  # GET /editais/new
  # GET /editais/new.xml
  def new
    @edital = Edital.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @edital }
    end
  end

  # GET /editais/1/edit
  def edit
    @edital = Edital.find(params[:id])
  end

  # POST /editais
  # POST /editais.xml
  def create
    @edital = Edital.new(params[:edital])

    respond_to do |format|
      if @edital.save
        format.html { redirect_to(@edital, :notice => 'Edital was successfully created.') }
        format.xml  { render :xml => @edital, :status => :created, :location => @edital }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @edital.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /editais/1
  # PUT /editais/1.xml
  def update
    @edital = Edital.find(params[:id])

    respond_to do |format|
      if @edital.update_attributes(params[:edital])
        format.html { redirect_to(@edital, :notice => 'Edital was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @edital.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /editais/1
  # DELETE /editais/1.xml
  def destroy
    @edital = Edital.find(params[:id])
    @edital.destroy

    respond_to do |format|
      format.html { redirect_to(editais_url) }
      format.xml  { head :ok }
    end
  end
end
