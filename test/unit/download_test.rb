require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  should belong_to(:empresa)
  should belong_to(:documento)

  test "should send an email with download link after create" do
    documento = documentos(:one)
    documento.edital = editais(:one)
    documento.arquivo = File.open(File.join(Rails.root, 'test', 'fixtures', 'downloads.yml'))
    documento.save

    empresa = empresas(:one)
    Download.create(:empresa => empresas(:one), :documento => documento)

    deliveries = ActionMailer::Base.deliveries
    assert !deliveries.empty?
  end

  test "should generate a uniq token before create" do
    download = Download.new
    download.save

    assert download.token.present?
  end

  test "should not be complete when created" do
    download = Download.new
    assert !download.completed?
  end

  test "should be set as complete" do
    download = downloads(:one)
    download.complete!

    assert download.completed?
  end
end
