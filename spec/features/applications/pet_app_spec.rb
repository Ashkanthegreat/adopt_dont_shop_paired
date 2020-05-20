require 'rails_helper'

describe "Pet Applications" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", description: "Sweet boy", approximate_age: "5", sex: "Male", shelter_id: @shelter1.id)
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a pup", shelter_id: @shelter1.id)
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a pup", shelter_id: @shelter2.id)
  end

  it "can apply for a pet" do
    visit "/favorites"

    expect(page).to_not have_link("Adopt Pets")

    visit "/pets/#{@pet1.id}"
    click_on "Favorite #{@pet1.name}"

    visit "/pets/#{@pet2.id}"
    click_on "Favorite #{@pet2.name}"

    visit "/pets/#{@pet3.id}"
    click_on "Favorite #{@pet3.name}"

    visit "/favorites"

    click_on "Adopt Pets"

    expect(current_path).to eq("/applications/new")
    check(@pet1.id)
    check(@pet2.id)

    fill_in :name, with: "Ash"
    fill_in :address, with: "123 Main St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80231"
    fill_in :phone, with: "720-555-5555"
    fill_in :description, with: "I am awesome!"

    click_on "Submit Application"

    expect(current_path).to eq("/favorites")
    expect(page).to have_content("Application Submitted")
    within("#allFavoritePets") do
      expect(page).to_not have_content("#{@pet1.name}")
      expect(page).to_not have_content("#{@pet2.name}")
      expect(page).to have_content("#{@pet3.name}")
    end
  end

  it "can not apply for a pet without filling in all required field" do
    visit "/favorites"

    expect(page).to_not have_link("Adopt Pets")

    visit "/pets/#{@pet1.id}"
    click_on "Favorite #{@pet1.name}"

    visit "/pets/#{@pet2.id}"
    click_on "Favorite #{@pet2.name}"

    visit "/pets/#{@pet3.id}"
    click_on "Favorite #{@pet3.name}"

    visit "/favorites"

    click_on "Adopt Pets"

    # Missing Zip Code
    check(@pet1.id)
    check(@pet2.id)
    fill_in :name, with: "Ash"
    fill_in :address, with: "123 Main St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :phone, with: "720-555-5555"
    fill_in :description, with: "I am awesome!"

    click_on "Submit Application"

    expect(current_path).to eq("/applications/new")
    expect(page).to have_content("All Fields Required!")



    fill_in :name, with: "Ash"
    fill_in :address, with: "123 Main St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80231"
    fill_in :phone, with: "720-555-5555"
    fill_in :description, with: "I am awesome!"

    click_on "Submit Application"

    expect(current_path).to eq("/applications/new")
    expect(page).to have_content("All Fields Required!")
  end
end
