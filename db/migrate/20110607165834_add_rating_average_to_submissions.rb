class AddRatingAverageToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :rating_average, :decimal, :default => 0, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :submissions, :rating_average
  end
end
