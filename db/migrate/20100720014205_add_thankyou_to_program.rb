class AddThankyouToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :thankyou, :text
  end

  def self.down
    remove_column :programs, :thankyou
  end
end
