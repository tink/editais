class AddSiteToEditais < ActiveRecord::Migration
  def self.up
    add_column :editais, :site, :string
  end

  def self.down
    remove_column :editais, :site
  end
end
