class Edital < ActiveRecord::Base
  belongs_to :instituicao
  has_many :documentos

  validates_presence_of :nome, :resumo, :data_publicacao, :data_limite, :instituicao_id
  validates_length_of :resumo, :within => 10..250
  validates_format_of :site, :with => URI::regexp(%w(http https)), :allow_blank => true

  accepts_nested_attributes_for :documentos

  acts_as_taggable

  def self.em_aberto
    scoped.where('data_limite >= ?', Date.today)
  end

  def self.recentemente_finalizados
    scoped.where('data_limite < ?', Date.today).order('data_limite DESC').limit(10)
  end
end
