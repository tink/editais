class Empresa < ActiveRecord::Base
  validates_presence_of :razao_social, :telefone_1, :email, :endereco, :responsavel, :cnpj
  validates_uniqueness_of :email, :cnpj, :case_sensitive => false

  has_many :downloads

  usar_como_cnpj :cnpj

  def self.that_download_an_edital(edital)
    empresas = scoped
    empresas = empresas.includes(:downloads => [:documento])
    empresas = empresas.where(:documentos => {:edital_id => edital.id})
    empresas = empresas.where(:downloads => {:completed => true})
    empresas
  end
end
