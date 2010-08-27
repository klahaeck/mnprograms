class AddRatingAverageToApplicants < ActiveRecord::Migration
  def self.up
  	add_column :applicants, :rating_average, :decimal, :default => 0, :precision => 6, :scale => 2
  end

  def self.down
  	remove_column :applicants, :rating_average
  end
end
