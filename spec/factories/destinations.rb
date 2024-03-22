# spec/factories/destinations.rb

FactoryBot.define do
    factory :destination do
      sequence(:name) { |n| "Destination #{n}" }
      description { 'Destination description' }
      image_url { 'https://example.com/image.jpg' }
      price_per_night { 100 }
      price_per_meal { 50 }
      created_at { Time.now }
      updated_at { Time.now }
    end
  end