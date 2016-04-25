class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.date :rdate
      t.string :genre
      t.string :dname
      t.string :actor1
      t.string :actor2

      t.timestamps null: false
    end
  end
end
