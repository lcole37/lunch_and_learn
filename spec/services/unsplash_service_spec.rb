require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  it "retrieves images related to the searched country" do
    country = "laos"
    images = UnsplashService.get_images(country)

    expect(images).to be_an Array
    expect(images.count).to eq 10
    images.each do |image|
      expect(image.keys).to eq([:id, :created_at, :updated_at, :promoted_at, :width, :height, :color, :blur_hash, :description, :alt_description, :urls, :links, :likes, :liked_by_user, :current_user_collections, :sponsorship, :topic_submissions, :user, :tags])
      expect(image[:alt_description]).to be_a String
      expect(image[:urls]).to be_a Hash
      expect(image[:urls].keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])
      expect(image[:urls][:raw]).to be_a String
    end
  end
end
