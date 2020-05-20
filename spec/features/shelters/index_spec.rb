require 'rails_helper'

describe "Shelters index page", type: :feature do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a puppy", shelter_id: @shelter2.id, adoption_status: "adoptable")

    @application1 = Application.create(name: "Taylor", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "I love pets")
    @application2 = Application.create(name: "Ash", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "Great Pet Owner!!!")
    @pet_app1 = PetApplication.create(pet_id: @pet1.id, application_id: @application1.id)
    @pet_app2 = PetApplication.create(pet_id: @pet2.id, application_id: @application1.id)
    @pet_app3 = PetApplication.create(pet_id: @pet1.id, application_id: @application2.id)
    @pet_app3 = PetApplication.create(pet_id: @pet2.id, application_id: @application2.id)
  end

  it "Can see a list of all shelters" do
    visit "/shelters"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end

  it "Can See a link to create a new shelter: 'New Shelter'" do
    visit "/shelters"

    expect(page).to have_link("New Shelter", :href=> "/shelters/new")
  end

  it "can see a link to update a shelter's information" do
    visit "/shelters"

    expect(page).to have_link("Update Shelter")
  end

  it "can see a link to delete a shelter" do
    visit "/shelters"

    expect(page).to have_link("Delete #{@shelter1.name}")

    click_on "Delete #{@shelter1.name}"

    expect(page).to have_content(@shelter2.name)
    expect(page).to_not have_content(@shelter1.name)
  end

  it "can not create a shelter with missing fields" do
    visit "/shelters"
    click_on "New Shelter"

    fill_in "name", with: "Pups For You"
    fill_in "address", with: "1808 Pup lane"
    fill_in "state", with: "Colorado"
    fill_in "zip", with: "80027"
    
    click_on "Create Shelter"

    expect(page).to have_content("City can't be blank")

    fill_in "name", with: "Pups For You"
    fill_in "address", with: "1808 Pup lane"
    fill_in "zip", with: "80027"

    click_on "Create Shelter"

    expect(page).to have_content("City can't be blank and State can't be blank")

    fill_in "address", with: "1808 Pup lane"
    fill_in "zip", with: "80027"

    click_on "Create Shelter"

    expect(page).to have_content("Name can't be blank, City can't be blank, and State can't be blank")
  end

end
