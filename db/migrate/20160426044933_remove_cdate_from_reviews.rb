class RemoveCdateFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :cdate, :date
  end
end
