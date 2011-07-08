class CreateEditais < ActiveRecord::Migration
  def self.up
    create_table :editais do |t|
      t.string :nome
      t.text :resumo
      t.string :descricao
      t.date :data_publicacao
      t.date :data_limite

      t.timestamps
    end
  end

  def self.down
    drop_table :editais
  end
end
