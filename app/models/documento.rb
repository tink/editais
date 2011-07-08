class Documento < ActiveRecord::Base
  belongs_to :edital
  mount_uploader :arquivo, ArquivoUploader

  validates_presence_of :nome, :data_publicacao, :arquivo
end
