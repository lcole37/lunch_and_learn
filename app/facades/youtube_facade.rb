class YoutubeFacade
  def self.create_video(country)
    video = YoutubeService.get_video(country)
    # require "pry"; binding.pry
    return [] if video.nil?

    Video.new(video)
  end
end
