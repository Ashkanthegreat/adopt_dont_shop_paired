require 'rails_helper'

describe "Shelters index page", type: :feature do
  it "Can see a list of all shelters" do
    shelter1 = Shelter.create(name: "Pups For You")
    shelter2 = Shelter.create(name: "Kitty Rescue")

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end

  it "Can See a link to create a new shelter: 'New Shelter'" do

    visit "/shelters"

    expect(page).to have_link("New Shelter", :href=> "/shelters/new")
  end

  it "can see a link to update a shelter's information" do
    shelter1 = Shelter.create(name: "Pups For You")
    shelter2 = Shelter.create(name: "Kitty Rescue")

    visit "/shelters"

    expect(page).to have_link("Update Shelter")
  end

  it "can see a link to delete a shelter" do
    shelter1 = Shelter.create(name: "Pups For You")
    shelter2 = Shelter.create(name: "Kitty Rescue")

    visit "/shelters"

    expect(page).to have_link("Delete #{shelter1.name}")

    click_on "Delete #{shelter1.name}"

    expect(page).to have_content(shelter2.name)
    expect(page).to_not have_content(shelter1.name)
  end
end
