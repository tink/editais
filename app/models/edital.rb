class Edital < ActiveRecord::Base
  has_many :documentos
  validates_presence_of :nome, :resumo, :data_publicacao, :data_limite
  accepts_nested_attributes_for :documentos
end
