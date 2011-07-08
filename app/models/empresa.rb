class Empresa < ActiveRecord::Base
  validates_presence_of :razao_social, :telefone_1, :email, :endereco, :responsavel, :cnpj
end
