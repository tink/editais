class DownloadNotifier < ActionMailer::Base
  default :from => "testes@tink.com.br"

  def ready_download(download)
    @download = download
    mail :to => download.empresa.email, :subject => "Link para download do edital"
  end
end
