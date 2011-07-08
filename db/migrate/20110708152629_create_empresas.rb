class CreateEmpresas < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string :razao_social
      t.string :email
      t.string :telefone_1
      t.string :telefone_2
      t.string :endereco
      t.string :responsavel
      t.string :cnpj

      t.timestamps
    end
  end

  def self.down
    drop_table :empresas
  end
end
