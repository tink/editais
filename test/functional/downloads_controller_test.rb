require 'test_helper'

class DownloadsControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)
    @documento = documentos(:one)
    @documento.edital = @edital
    @documento.arquivo = File.open(File.join(Rails.root, 'test', 'fixtures', 'downloads.yml'))
    @documento.save

    @empresa = empresas(:one)

    @download = downloads(:one)
    @download.documento = @documento
    @download.save
  end

  test "should not create a duplicated download but sends the email" do
    assert_no_difference('Download.count') do
      post :create, {:d => @documento.id}, {:empresa_id => @empresa.id}
    end

    assert_redirected_to(@edital)
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "should create download" do
    assert_difference('Download.count') do
      post :create, {:d => @documento.id}, {:empresa_id => empresas(:two) }
    end

    assert_redirected_to(@edital)
  end

  test "should show download and update it as completed" do
    get :show, :id => @download.token
    @download.reload

    assert_response :success
    assert @download.completed?
  end
end
