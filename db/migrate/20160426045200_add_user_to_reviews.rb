class AddUserToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_email, :string
    add_index :reviews, :user_email
  end
end
