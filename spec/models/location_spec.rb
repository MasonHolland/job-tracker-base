require 'rails_helper'

describe Location do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a city" do
        company = Company.create(name: "Dutch Boys Toys")
        location = Location.create(city: nil, branch: "CBD", company_id: company.id)
        expect(location).to be_invalid
      end

      it "is invalid without a company id" do
        location = Location.create(city: "Perth", branch: "CBD", company_id: nil)
        expect(location).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a city and category" do
        company = Company.create(name: "Dutch Boys Toys")
        location = Location.create(city: "Perth", branch: "CBD", company_id: company.id)
        expect(location).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.create(name: "Dutch Boys Toys")
      location = Location.create(city: "Perth", branch: "CBD", company_id: company.id)
      expect(location).to respond_to(:company)
    end
  end
end
