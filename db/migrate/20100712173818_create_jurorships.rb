class CreateJurorships < ActiveRecord::Migration
  def self.up
    create_table :jurorships do |t|
      t.integer :program_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jurorships
  end
end
