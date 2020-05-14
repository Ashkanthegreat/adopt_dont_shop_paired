require "rails_helper"

describe "Favorite Pets Index Page" do
  it "Can see a Favorite indicator in the Nav bar, on any page" do
    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    visit "/shelters"

    expect(page).to have_content("Favorite Pets: 0")

    visit "/pets"

    expect(page).to have_content("Favorite Pets: 0")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_content("Favorite Pets: 0")
  end
end



# User Story 8, Favorite Indicator
#
# As a visitor
# I see a favorite indicator in my navigation bar
# The favorite indicator shows a count of pets in my favorites list
# I can see this favorite indicator from any page in the application
