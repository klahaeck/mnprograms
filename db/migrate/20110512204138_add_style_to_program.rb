class AddStyleToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :style, :string
  end

  def self.down
    remove_column :programs, :style
  end
end
