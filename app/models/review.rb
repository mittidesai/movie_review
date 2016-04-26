class Review < ActiveRecord::Base
    belongs_to :movie
    has_one :user
    #validates :text, presence: true
    validates :ratings, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end