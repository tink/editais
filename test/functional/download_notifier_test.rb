require 'test_helper'

class DownloadNotifierTest < ActionMailer::TestCase
  include Rails.application.routes.url_helpers

  setup do
    @edital = editais(:one)

    @documento = documentos(:one)
    @documento.edital = @edital

    @download = downloads(:one)
    @download.empresa = empresas(:one)
    @download.documento = @documento
  end

  test "ready_download" do
    mail = DownloadNotifier.ready_download(@download)

    assert_equal "Ready download", mail.subject
    assert_equal ["test@test.com"], mail.to
    assert_equal ["testes@tink.com.br"], mail.from

    assert_match @edital.nome, mail.body.encoded
    assert_match @documento.nome, mail.body.encoded
    assert_match download_url(@download.token, :host => 'localhost:3000'), mail.body.encoded
  end

end
