class UnsplashFacade
  def self.create_images(country)
    images = UnsplashService.get_images(country)
    return [] if images.count == 0

    images.map {|image| Image.new(image)}
  end
end
