class AddImageToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :image, :string
  end

  def self.down
    remove_column :works, :image
  end
end
