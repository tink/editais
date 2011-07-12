class Edital < ActiveRecord::Base
  belongs_to :instituicao
  has_many :documentos

  validates_presence_of :nome, :resumo, :data_publicacao, :data_limite, :instituicao_id
  accepts_nested_attributes_for :documentos

  acts_as_taggable
end
