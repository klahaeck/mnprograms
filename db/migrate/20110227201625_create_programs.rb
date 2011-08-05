class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.string :title
      t.string :url
      t.text :description
      t.text :guidelines
      t.text :contact
      t.text :thankyou
      t.date :start
      t.date :end
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
