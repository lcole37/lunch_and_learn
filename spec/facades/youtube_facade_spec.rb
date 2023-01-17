require 'rails_helper'

describe YoutubeFacade, :vcr do
  describe '.create_video' do
    it "creates a video object" do
      video = YoutubeFacade.create_video("Laos")

      expect(video).to be_a Video
    end
    it "returns empty array if no results" do
      video = YoutubeFacade.create_video("notarealcountry")

      expect(video).to eq([])
    end
  end
end
