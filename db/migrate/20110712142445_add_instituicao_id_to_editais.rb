class AddInstituicaoIdToEditais < ActiveRecord::Migration
  def self.up
    add_column :editais, :instituicao_id, :integer
  end

  def self.down
    remove_column :editais, :instituicao_id
  end
end
