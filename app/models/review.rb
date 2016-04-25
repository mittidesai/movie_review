class Review < ActiveRecord::Base
    belongs_to :movie
    validates :owner, presence: true
    validates :text, presence: true
    validates :ratings, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end