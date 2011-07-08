class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.references :edital
      t.string :nome
      t.string :arquivo
      t.date :data_publicacao

      t.timestamps
    end
  end

  def self.down
    drop_table :documentos
  end
end
