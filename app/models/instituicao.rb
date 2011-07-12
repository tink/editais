class Instituicao < ActiveRecord::Base
  validates :nome, :presence => true, :uniqueness => true

  has_many :users
  has_many :editais
end
