require 'rails_helper'

RSpec.describe CountryService, :vcr do
  it 'retrieves a random country (for empty search)' do
    country = CountryService.get_random_country

    expect(country).to be_a String
  end
end
