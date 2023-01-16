class UnsplashService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com', params: { client_id: ENV['unsplash_api_key']})
  end

  def self.get_images(country)
    response = conn.get('/search/photos?page=1&orientation=squarish', { query: country})
    parsed = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
