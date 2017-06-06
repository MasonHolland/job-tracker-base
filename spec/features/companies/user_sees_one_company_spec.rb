require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  # As a user,
  # When I visit a specific company page,
  # I see the name of each of the office locations associated with that company.
  scenario "the locations are present" do
    company = Company.create!(name: "Dutch Boys Toys")
    location_1 = Location.create(city: "Denver", company_id: company.id)
    location_2 = Location.create(city: "Perth", company_id: company.id)

    visit company_path(company)

    expect(page).to have_content("Locations:")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Perth")
  end

  # As a user,
  # When I visit a specific company page,
  # I also see a count of how many officies that company has in each specific location listed.

  scenario "the locations have a count for the amount of offices" do
    company = Company.create!(name: "Dutch Boys Toys")
    location_1 = Location.create(city: "Denver", branch: "CBD", company_id: company.id)
    location_2 = Location.create(city: "Denver", branch: "The Highlands", company_id: company.id)
    location_3 = Location.create(city: "Perth", branch: "CBD", company_id: company.id)
    location_4 = Location.create(city: "Perth", branch: "Leederville", company_id: company.id)
    location_5 = Location.create(city: "Perth", branch: "Cottesloe", company_id: company.id)


    visit company_path(company)
    save_and_open_page

    expect(page).to have_content("Locations:")
    expect(page).to have_content("Denver - 2")
    expect(page).to have_content("Perth - 3")
  end
end
