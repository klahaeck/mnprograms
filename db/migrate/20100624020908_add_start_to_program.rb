class AddStartToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :start, :date
  end

  def self.down
    remove_column :programs, :start
  end
end
