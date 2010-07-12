class CreateApplicants < ActiveRecord::Migration
  def self.up
    create_table :applicants do |t|
      t.integer :program_id
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone
      t.string :email
      t.string :website
      t.timestamps
    end
  end
  
  def self.down
    drop_table :applicants
  end
end
