class LearningResource
  attr_reader :country,
              :id,
              :images,
              :video
  def initialize(images, video, country)
     @id = nil
     @images = images
     @video = video
     @country = country
  end
end
