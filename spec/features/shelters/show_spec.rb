require 'rails_helper'

describe "Shelters show page", type: :feature do
  it "Can see a single shelter" do
    shelter1 = Shelter.create(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")


    visit "shelters/#{shelter1.id}"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
  end

  it "can update a shelter's information" do

    shelter1 = Shelter.create(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    visit "shelters/#{shelter1.id}"
    click_on "Update Shelter"

    expect(page).to have_content("Edit Shelter")

    fill_in "Address", with: "2000 Puppy Dr."

    click_on "Update Shelter"

    expect(page).to have_content("2000 Puppy Dr.")
  end

  it "can delete a shelter" do
    shelter1 = Shelter.create(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    shelter2 = Shelter.create(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")

    visit "shelters/#{shelter1.id}"

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to have_content(shelter2.name)
    expect(page).to_not have_content("Pups for You")
  end
end
