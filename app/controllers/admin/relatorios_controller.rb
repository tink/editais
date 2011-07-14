class Admin::RelatoriosController < Admin::BaseController
  set_tab :relatorios

  def downloads_por_edital
    @edital = current_instituicao.editais.find(params[:id])
    @resumo_downloads = Documento.downloads_by_edital(@edital)
    @empresas = Empresa.that_download_an_edital(@edital)
  end
end
