class DownloadObserver < ActiveRecord::Observer
  def after_create(download)
    DownloadNotifier.ready_download(download).deliver!
  end
end
