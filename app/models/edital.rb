class Edital < ActiveRecord::Base
  validates_presence_of :nome, :resumo, :data_publicacao, :data_limite
end
