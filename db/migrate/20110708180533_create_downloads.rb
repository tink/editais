class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string :token
      t.boolean :completed, :defaul => false
      t.references :empresa
      t.references :documento

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
