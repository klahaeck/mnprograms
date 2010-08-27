class AddNameToJuror < ActiveRecord::Migration
  def self.up
    add_column :jurors, :name, :string
  end

  def self.down
    remove_column :jurors, :name
  end
end
