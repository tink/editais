class DownloadsController < ApplicationController
  # GET /downloads/1
  # GET /downloads/1.xml
  def show
    @download = Download.find_by_token(params[:id])
    @download.complete!
    if CarrierWave.configure(&:storage) == CarrierWave::Storage::S3
      redirect_to @download.documento.arquivo.url
    else
      send_file(@download.documento.arquivo.path)
    end
  end

  # POST /downloads
  # POST /downloads.xml
  def create
    empresa = Empresa.find(session[:empresa_id])
    documento = Documento.find(params[:d])

    if @download = Download.find_by_documento_id_and_empresa_id(documento.id, empresa.id)
      @download.send_notification
    else
      @download = Download.new(:documento_id => documento.id, :empresa_id => empresa.id)
    end

    respond_to do |format|
      if @download.save
        format.html { redirect_to(documento.edital, :notice => "Um e-mail foi enviado para #{empresa.email} contendo o link para download.") }
        format.xml  { render :xml => @download, :status => :created, :location => @download }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @download.errors, :status => :unprocessable_entity }
      end
    end
  end
end
