class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :ratings
      t.date :cdate
      t.string :owner
      t.text :text

      t.timestamps null: false
    end
  end
end
