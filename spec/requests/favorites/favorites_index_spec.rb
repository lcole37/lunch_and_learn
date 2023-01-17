require 'rails_helper'

describe "Favorites Index" do
  describe 'Get /index', :vcr do
    before :each do
      @user1 = User.create!(name: "Happy", email: "example@happyemail.com", api_key: "012345")
      @user2 = User.create!(name: "User 2", email: "example@sademail.com", api_key: "543210")

      @favorite1 = @user1.favorites.create!(country: "Italy", recipe_link: "https//www.allrecipes.com", recipe_title: "Italian Recipe")
      @favorite2 = @user1.favorites.create!(country: "Morocco", recipe_link: "https//www.goodeats.com", recipe_title: "Moroccan Recipe")
    end

    it "returns favorites for user" do
      get '/api/v1/favorites', params: { api_key: @user1.api_key }

      expect(response).to be_successful

      user_1_favorites = JSON.parse(response.body, symbolize_names: true)

      expect(user_1_favorites).to be_a Hash
      expect(user_1_favorites).to have_key(:data)
      expect(user_1_favorites[:data]).to be_an Array
      expect(user_1_favorites[:data].count).to eq 2
      expect(user_1_favorites[:data]).to all(have_key(:id))
      expect(user_1_favorites[:data]).to all(have_key(:attributes))
      expect(user_1_favorites[:data][0][:attributes].keys).to eq([:recipe_title, :recipe_link, :country, :created_at])

      expect(user_1_favorites[:data][0][:attributes]).to_not have_key(:updated_at)
    end

    it "returns blank array for favorites if user has none" do

    end

    it "does not return with missing parameters" do

    end

  end
end
