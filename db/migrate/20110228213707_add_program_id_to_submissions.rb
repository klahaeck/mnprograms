class AddProgramIdToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :program_id, :integer
  end

  def self.down
    remove_column :submissions, :program_id
  end
end
