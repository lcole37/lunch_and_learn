require 'rails_helper'

describe UnsplashFacade, :vcr do
  describe '.create_images' do
    it "creates an array of image objects" do
      images = UnsplashFacade.create_images('Laos')

      expect(images).to be_an Array
      images.each do |image|
        expect(image).to be_an Image
      end
    end
    it "returns empty array if no results" do
      images = UnsplashFacade.create_images('notrealcountry')

      expect(images).to eq([])
    end
  end
end
