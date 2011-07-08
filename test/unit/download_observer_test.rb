require 'test_helper'

class DownloadObserverTest < ActiveSupport::TestCase
  setup do
    @edital = editais(:one)

    @documento = documentos(:one)
    @documento.edital = @edital
    @documento.arquivo = File.open(File.join(Rails.root, 'test', 'fixtures', 'downloads.yml'))
    @documento.save

    @empresa = empresas(:one)
  end

  test "should send an email with download link after create" do
    Download.create(:empresa => @empresa, :documento => @documento)

    deliveries = ActionMailer::Base.deliveries
    assert !deliveries.empty?
  end
end
