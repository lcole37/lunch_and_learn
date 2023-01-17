
RSpec.describe LearningResource do
		before :each do
      country = "Poland"
      images = UnsplashFacade.create_images(country)
      video = YoutubeFacade.create_video(country)

			@lr1 = LearningResource.new(images, video, country)
		end

		it "exists" do
			expect(@lr1).to be_a(LearningResource)
		end

		it "has attributes" do
      expect(@lr1.id).to be(nil)
      expect(@lr1.images).to be_an Array
      expect(@lr1.video).to be_a Video
      expect(@lr1.country).to eq("Poland")
      @lr1.images.each do |image|
        expect(image).to be_an Image
      end
    end
end
