require 'rails_helper'

describe CompanyLocation do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a company id" do
        company = Company.create(name: "Dropbox")
        company_location = CompanyLocation.create(company_id: company.id, location_id: nil)

        expect(company_location).to be_invalid
      end

      it "is invalid without a location id" do
        location = Location.create(area: "CBD")
        company_location = CompanyLocation.create(company_id: nil, location_id: location.id)

        expect(company_location).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with an area" do
        location = Location.create(area: "CBD")
        company = Company.create(name: "Dropbox")
        company_location = CompanyLocation.create(company_id: company.id, location_id: location.id)

        expect(company_location).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many companies" do
      location = Location.create(area: "CBD")
      company = Company.create(name: "Dropbox")
      company_location = CompanyLocation.create(company_id: company.id, location_id: location.id)

      expect(company_location).to respond_to(:companies)
    end
  end
end
