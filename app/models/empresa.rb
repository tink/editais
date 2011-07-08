class Empresa < ActiveRecord::Base
  validates_presence_of :razao_social, :telefone_1, :email, :endereco, :responsavel, :cnpj
  validates_uniqueness_of :email, :cnpj, :case_sensitive => false

  usar_como_cnpj :cnpj
end
