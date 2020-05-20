require 'rails_helper'

describe "deleting a shelter" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @shelter3 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a puppy", shelter_id: @shelter2.id, adoption_status: "adoptable")
    @pet4 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Arrow", approximate_age: "12", sex: "Male", description: "It's a puppy", shelter_id: @shelter2.id, adoption_status: "Pending")
    @pet5 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Spike", approximate_age: "14", sex: "Male", description: "It's a puppy", shelter_id: @shelter3.id, adoption_status: "adoptable")
    @pet6 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Ace", approximate_age: "12", sex: "Male", description: "It's a puppy", shelter_id: @shelter3.id, adoption_status: "adoptable")

    @application1 = Application.create(name: "Taylor", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "I love pets")
    @application2 = Application.create(name: "Ash", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "Great Pet Owner!!!")
    @application3 = Application.create(name: "Meg", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "Lots of friendly pups at home")

    @pet_app1 = PetApplication.create(pet_id: @pet1.id, application_id: @application1.id)
    @pet_app2 = PetApplication.create(pet_id: @pet2.id, application_id: @application1.id)
    @pet_app3 = PetApplication.create(pet_id: @pet1.id, application_id: @application2.id)
    @pet_app4 = PetApplication.create(pet_id: @pet2.id, application_id: @application2.id, approved: true)
    @pet_app5 = PetApplication.create(pet_id: @pet5.id, application_id: @application3.id)
    @pet_app6 = PetApplication.create(pet_id: @pet6.id, application_id: @application3.id)

    @review1 = @shelter3.reviews.create!(title: "Great Shelter", rating: "4.5", content: "I had an amazing experience", picture: nil)
    @review2 = @shelter3.reviews.create!(title: "Amazing Rescue", rating: "5", content: "Super friendly staff", picture: "https://imgur.com/rjS5VMO")
  end

  it "can not delete a shelter if any pets have a 'Pending' status" do
    visit "/shelters/#{@shelter2.id}"
    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters/#{@shelter2.id}")
    expect(page).to have_content("Can not delete this shelter")
  end

  it "will delete all pets for the shelter when the shelter is destroyed" do
    visit "/shelters/#{@shelter3.id}"
    click_on "Delete Shelter"

    expect(Shelter.exists?(@shelter3.id)).to eq(false)
    expect(Pet.exists?(@pet5.id)).to eq(false)
    expect(Pet.exists?(@pet6.id)).to eq(false)
  end

  it "can delete a shelter as long as not pets have an approved application" do
    visit "/shelters/#{@shelter1.id}"
    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    expect(page).to have_content("Can not delete this shelter")

    @pet_app4.update(approved: false)

    click_on "Delete Shelter"

    expect(Shelter.exists?(@shelter1.id)).to eq(false)
    expect(Pet.exists?(@pet1.id)).to eq(false)
    expect(Pet.exists?(@pet2.id)).to eq(false)
  end

  it "will delete all reviews for that shelter when the shelter is deleted" do
    visit "/shelters/#{@shelter3.id}"
    click_on "Delete Shelter"

    expect(Shelter.exists?(@shelter3.id)).to eq(false)
    expect(Review.exists?(@review1.id)).to eq(false)
    expect(Review.exists?(@review2.id)).to eq(false)
  end
end
