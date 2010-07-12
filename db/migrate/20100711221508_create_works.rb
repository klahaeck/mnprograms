class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.integer :submission_id
      t.integer :type_id
      t.string :title
      t.string :url
      t.timestamps
    end
  end
  
  def self.down
    drop_table :works
  end
end
