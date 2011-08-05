class AddLogoToPrograms < ActiveRecord::Migration
  def self.up
    add_column :programs, :logo, :string
  end

  def self.down
    remove_column :programs, :logo
  end
end
