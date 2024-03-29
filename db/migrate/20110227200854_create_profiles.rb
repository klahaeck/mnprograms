class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
