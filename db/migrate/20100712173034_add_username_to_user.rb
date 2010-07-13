class AddUsernameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :role, :string
  end

  def self.down
    remove_column :users, :role
    remove_column :users, :username
  end
end
