class CountryService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.get_random_country
    response = conn.get("v3.1/all")
    shuffled_countries = JSON.parse(response.body, symbolize_names: true).shuffle
    shuffled_countries[0][:name][:common]
  end
end
