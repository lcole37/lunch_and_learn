class LearningResourceFacade
  def self.create_learning_resource(country)
    video = YoutubeFacade.create_video(country)
    images = UnsplashFacade.create_images(country)

    LearningResource.new(images, video, country)
  end
end
