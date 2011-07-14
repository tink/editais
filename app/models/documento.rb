class Documento < ActiveRecord::Base
  belongs_to :edital
  has_many :downloads

  mount_uploader :arquivo, ArquivoUploader

  validates_presence_of :nome, :data_publicacao, :arquivo

  def self.downloads_by_edital(edital)
    summary = scoped
    summary = summary.select('documentos.nome as nome_documento, SUM( IF(downloads.completed, 1, 0) )  as quantidade_de_downloads')
    summary = summary.joins('LEFT JOIN downloads ON documentos.id = downloads.documento_id')
    summary = summary.where(:edital_id => edital.id)
    summary = summary.group('nome_documento')
    summary = summary.order('nome_documento')
    summary
  end
end
