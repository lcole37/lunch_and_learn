require 'rails_helper'

describe "Favorites Create", vcr: { record: :new_episodes } do
  before :each do
    @happy = User.create!(name: "Happy", email: "example@happyemail.com", api_key: "012345")
  end
  let(:headers) { { CONTENT_TYPE: 'application/json' } }

  it "Happy, can successfully post favorite" do
    happy_data = {
        api_key: "012345",
        country: "Poland",
        recipe_link: "https//www.allrecipes.com",
        recipe_title: "Poland Recipe"
    }

    expect do
      post "/api/v1/favorites", headers: headers, params: JSON.generate(happy_data)
    end.to change(Favorite, :count).by(+1)

    expect(response).to have_http_status(422)
  end

  # it "Sad, returns error if api key not found" do
  # end
end
