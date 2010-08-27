class EditJurorships < ActiveRecord::Migration
  def self.up
  	rename_column :jurorships, :user_id, :juror_id
  end

  def self.down
  end
end
