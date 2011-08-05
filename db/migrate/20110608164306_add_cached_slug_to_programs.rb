class AddCachedSlugToPrograms < ActiveRecord::Migration
  def self.up
    add_column :programs, :cached_slug, :string
  end

  def self.down
    remove_column :programs, :cached_slug
  end
end
