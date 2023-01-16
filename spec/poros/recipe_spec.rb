RSpec.describe Recipe do
		before :each do
			data = {title: "example",
              url: "url.example.com",
              country: "country example",
              image: "image url"}
			@recipe = Recipe.new(data)
		end

		it "exists" do
			expect(@recipe).to be_a(Recipe)
		end

		it "has attributes" do
			expect(@recipe.title).to eq("example")
			expect(@recipe.url).to eq("url.example.com")
			expect(@recipe.country).to eq("country example")
			expect(@recipe.image).to eq("image url")
    end
end
