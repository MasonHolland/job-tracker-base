require 'rails_helper'

describe "User sees one company" do
  scenario "location information is present" do
    company = Company.create!(name: "Dutch Boys Toys")
    company.jobs.create!(title: "Tall Boy", level_of_interest: 90, city: "Perth")
    location = Location.create(area: "CBD")
    cl = CompanyLocation.create(company_id: company.id, location_id: location.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Dutch Boys Toys")
    expect(page).to have_content("Tall Boy")
    expect(page).to have_content("Locations: CBD")
  end

  scenario "location count is present" do
    company = Company.create!(name: "Dutch Boys Toys")
    company.jobs.create!(title: "Tall Boy", level_of_interest: 90, city: "Perth")
    location_1 = Location.create(area: "CBD")
    location_2 = Location.create(area: "Downtown")
    cl_1 = CompanyLocation.create(company_id: company.id, location_id: location_1.id)
    cl_1 = CompanyLocation.create(company_id: company.id, location_id: location_1.id)
    cl_2 = CompanyLocation.create(company_id: company.id, location_id: location_2.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Dutch Boys Toys")
    expect(page).to have_content("Tall Boy")
    expect(page).to have_content("Locations: CBD - 2")
    expect(page).to have_content("Downtown - 1")
  end
end
