class Review < ActiveRecord::Base
    belongs_to :movie
    has_one :user
    validates :ratings, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end