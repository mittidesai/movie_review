class Movie < ActiveRecord::Base
    validates :title, presence: true
    has_many :reviews, dependent: :destroy
    has_many :watchlists, dependent: :destroy
    has_many :movies, through: :watchlists
    has_attached_file :poster, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
    def self.search(search)
        if search
            where(['lower(title) LIKE ? or lower(genre) LIKE ? or lower(dname) LIKE ? or lower(actor1) LIKE ? or lower(actor2) LIKE ? or lower(description) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
        end
    end
    def self.latest
        @latests = Movie.order(rdate: :desc).limit(6)
    end
end