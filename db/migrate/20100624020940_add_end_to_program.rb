class AddEndToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :end, :date
  end

  def self.down
    remove_column :programs, :end
  end
end
