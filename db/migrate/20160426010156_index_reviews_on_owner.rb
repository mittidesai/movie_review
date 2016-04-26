class IndexReviewsOnOwner < ActiveRecord::Migration
  def change
    add_index :reviews, :owner
  end
end
