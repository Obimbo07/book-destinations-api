class Destination < ApplicationRecord
    has_many :reservations

    validates :name, :description, :image_url, :price_per_night, :price_per_meal, presence: true
end
