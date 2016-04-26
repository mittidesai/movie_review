class RemoveOwnerFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :owner, :string
  end
end
