class AddDescricaoToEditais < ActiveRecord::Migration
  def self.up
    add_column :editais, :descricao, :text
  end

  def self.down
    remove_column :editais, :descricao
  end
end
