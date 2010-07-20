class AddPublishedToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :published, :boolean
  end

  def self.down
    remove_column :programs, :published
  end
end
