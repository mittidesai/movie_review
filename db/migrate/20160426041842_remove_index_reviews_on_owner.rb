class RemoveIndexReviewsOnOwner < ActiveRecord::Migration
  def change
    remove_index :reviews, :owner 
  end
end
