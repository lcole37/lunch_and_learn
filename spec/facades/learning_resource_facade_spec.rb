require 'rails_helper'

describe LearningResourceFacade, :vcr do
  describe '.create_learning_resource' do
    it "creates learning resource objects from country" do
      learning_resource = LearningResourceFacade.create_learning_resource("Laos")

      expect(learning_resource).to be_a LearningResource
    end
  end
end
