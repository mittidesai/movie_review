class AddMratingsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :mratings, :float
  end
end
