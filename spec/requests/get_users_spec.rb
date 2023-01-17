require 'rails_helper'

describe 'Users Create', vcr: { record: :new_episodes } do
  describe 'When I send a post request to /users' do
    describe 'and I send in attributes in body' do
      before :each do
        @user = {
                  "name": "Athena Dao",
                  "email": "athenadao@bestgirlever.com"
                }
        @sad_user_no_email = {
                      "name": "Athena Dao",
                        }
        @sad_user_not_unique = {
                            "name": "Not Athena Dao",
                            "email": "athenadao@bestgirlever.com"
                          }
      end

      let(:headers) { { CONTENT_TYPE: 'application/json' } }

      it 'creates a user based on attributes in body' do
        expect do
          post api_v1_users_path, headers: headers, params: JSON.generate(@user)
        end.to change(User, :count).by(+1)

        response_body = JSON.parse(response.body, symbolize_names: true)
        created_user = User.last

        expect(response).to have_http_status(201)
        expect(response_body[:data].keys).to eq([:id, :type, :attributes])
        expect(response_body[:data][:id].to_i).to eq(created_user.id)
        expect(response_body[:data][:type]).to eq('user')
        expect(response_body[:data][:attributes].keys).to eq([:name, :email, :api_key])
        expect(response_body[:data][:attributes]).to_not have_key(:id)
        expect(response_body[:data][:attributes][:name]).to eq(created_user.name)
        expect(response_body[:data][:attributes][:email]).to eq(created_user.email)
        expect(created_user.name).to eq(@user[:name])
        expect(created_user.email).to eq(@user[:email])
      end

      it "sad path, no creation without email" do
        post api_v1_users_path, headers: headers, params: JSON.generate(@sad_user_no_email)
        expect(response).to have_http_status(422)
      end

      it "sad path, no creation with used email" do
        post api_v1_users_path, headers: headers, params: JSON.generate(@user)

        expect(response).to have_http_status(201)
        expect(User.count).to eq(1) #remember to change if i seed a user

        post api_v1_users_path, headers: headers, params: JSON.generate(@sad_user_not_unique)

        expect(response).to have_http_status(422)
        expect(User.count).to eq(1)
      end
    end
  end
end
