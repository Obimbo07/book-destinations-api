require 'rails_helper'

RSpec.describe Destination, type: :model do
  it 'name should be present' do
    destination = Destination.new(description: 'Destination description', image_url: 'https://example.com/image.jpg')
    expect(destination).to_not be_valid
  end

  it 'description should be present' do
    destination = Destination.new(name: 'tokyo', image_url: 'https://example.com/image.jpg', price_per_night: 100, price_per_meal: 50)
    expect(destination).to_not be_valid
  end

  it 'image should be present' do
    destination = Destination.new(description: 'Destination description', image_url: 'https://example.com/image.jpg', price_per_night: 100, price_per_meal: 50)
    expect(destination).to_not be_valid
  end

  it 'destination should be valid' do
    destination = Destination.new(name: 'tokyo', description: 'Destination description', image_url: 'https://example.com/image.jpg', price_per_night: 100, price_per_meal: 50)
    expect(destination).to be_valid
  end
end