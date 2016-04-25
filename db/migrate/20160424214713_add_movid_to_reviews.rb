class AddMovidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :movie_id, :integer
    add_index :reviews, :movie_id
  end
end
