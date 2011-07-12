class AddInstituicaoIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :instituicao_id, :integer
  end

  def self.down
    remove_column :users, :instituicao_id
  end
end
