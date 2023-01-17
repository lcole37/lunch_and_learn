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

    expect(@happy.favorites.count).to eq(0)
    expect do
      post "/api/v1/favorites", headers: headers, params: JSON.generate(happy_data)
    end.to change(Favorite, :count).by(+1)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(422)
    expect(parsed.keys).to eq([:success])
    expect(parsed[:success]).to eq("Favorite added successfully")
    expect(@happy.favorites.last.country).to eq("Poland")
    expect(@happy.favorites.last.recipe_title).to eq("Poland Recipe")
    expect(@happy.favorites.last.recipe_link).to eq("https//www.allrecipes.com")
  end

  it "Sad, returns error if api key not found" do
    sad_data = {
        api_key: "543210",
        country: "Poland",
        recipe_link: "https//www.allrecipes.com",
        recipe_title: "Poland Recipe"
    }

    post "/api/v1/favorites", headers: headers, params: JSON.generate(sad_data)

    expect(response).to have_http_status(422)
  end
  it "Sad, returns error if missing params" do
    sad_data = {
        api_key: "543210",
        country: "Poland",
        recipe_title: "Poland Recipe"
    }

    post "/api/v1/favorites", headers: headers, params: JSON.generate(sad_data)

    expect(response).to have_http_status(422)
  end

end
