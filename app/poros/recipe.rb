class Recipe
  attr_reader :title,
              :url,
              :country,
              :image
  def initialize(data)
     @title = data[:title]
     @url = data[:url]
     @country = data[:country]
     @image = data[:image]
  end
end
