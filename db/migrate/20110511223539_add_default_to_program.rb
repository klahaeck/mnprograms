class AddDefaultToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :default, :boolean, :default => false
  end

  def self.down
    remove_column :programs, :default
  end
end
