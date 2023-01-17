class YoutubeService
  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com', params: { key: ENV['youtube_api_key'] })
  end

  def self.get_video(country)
    response = conn.get('/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&maxResults=1') do |f|
      f.params['q'] = country
    end
    parsed = JSON.parse(response.body, symbolize_names: true)[:items][0]
  end
end
