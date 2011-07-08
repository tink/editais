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
end
