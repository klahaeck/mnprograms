class AddMaxWorkToPrograms < ActiveRecord::Migration
  def self.up
    add_column :programs, :max_work, :integer
  end

  def self.down
    remove_column :programs, :max_work
  end
end
