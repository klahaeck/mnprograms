class AddResumeToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :resume, :string
  end

  def self.down
    remove_column :submissions, :resume
  end
end
