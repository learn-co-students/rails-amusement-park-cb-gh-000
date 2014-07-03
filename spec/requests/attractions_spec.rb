require 'rails_helper'

RSpec.describe "Attractions", :type => :request do
  describe "GET /attractions" do
    it "works! (now write some real specs)" do
      get attractions_path
      expect(response.status).to be(200)
    end
  end
end
