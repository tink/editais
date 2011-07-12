class RenameInstituicaosTableToInstituicoes < ActiveRecord::Migration
  def self.up
    rename_table :instituicaos, :instituicoes
  end

  def self.down
    rename_table :instituicoes, :instituicaos
  end
end
