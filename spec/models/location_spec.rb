require 'rails_helper'

describe Location do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an area" do
        location = Location.create(area: nil)

        expect(location).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with an area" do
        location = Location.create(area: "CBD")

        expect(location).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many companies" do
      location = Location.create(area: "CBD")

      expect(location).to respond_to(:companies)
    end
  end
end
