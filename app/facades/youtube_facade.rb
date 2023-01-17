class YoutubeFacade
  def self.create_video(country)
    video = YoutubeService.get_video(country)
    return [] if video.nil

    Video.new(video)
  end
end
