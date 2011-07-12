class CreateInstituicaos < ActiveRecord::Migration
  def self.up
    create_table :instituicaos do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :instituicaos
  end
end
