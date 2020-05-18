require 'rails_helper'

describe "Pet Applications show page" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", shelter_id: @shelter2.id, adoption_status: "adoptable")

    @application1 = Application.create(name: "Taylor", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "I love pets")
    @pet_app1 = PetApplication.create(pet_id: @pet1.id, application_id: @application1.id)
    @pet_app1 = PetApplication.create(pet_id: @pet2.id, application_id: @application1.id)
  end

  it "can see the applications show page with all application data" do
    visit "/applications/#{@application1.id}"

    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.address)
    expect(page).to have_content(@application1.city)
    expect(page).to have_content(@application1.state)
    expect(page).to have_content(@application1.zip)
    expect(page).to have_content(@application1.phone)
    expect(page).to have_content(@application1.description)
    expect(page).to have_link(@pet1.name)
    expect(page).to have_link(@pet2.name)
  end

  it "can accept and application for a specific pet" do
    visit "/applications/#{@application1.id}"

    within("#pet-#{@pet1.id}") do
      click_on "Approve Application"
    end

    expect(current_path).to eq("/pets/#{@pet1.id}")
    expect(@pet1.reload.adoption_status).to eq("Pending")
    expect(page).to have_content("Pending")

    visit "/applications/#{@application1.id}"

    within("#pet-#{@pet2.id}") do
      click_on "Approve Application"
    end
    expect(current_path).to eq("/pets/#{@pet2.id}")
    expect(@pet2.reload.adoption_status).to eq("Pending")
    expect(page).to have_content("Pending")
  end

  it "can approve multiple pets for one application" do
    visit "/applications/#{@application1.id}"

    within("#pet-#{@pet1.id}") do
      check(@pet1.id)
    end

    within("#pet-#{@pet2.id}") do
      check(@pet2.id)
    end

    click_on "Approve Selected Pets"

    expect(current_path).to eq("/favorites")

    expect(page).to have_content("Name: Rosco")
    expect(page).to have_content("Name: Bob")

  end
end
