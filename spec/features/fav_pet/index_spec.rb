require "rails_helper"

describe "Favorite Pets Index Page" do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", shelter_id: @shelter1.id)
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", shelter_id: @shelter1.id)
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", shelter_id: @shelter2.id)
  end

  it "Can see a Favorite indicator in the Nav bar, on any page" do

    visit "/shelters"

    expect(page).to have_content("Favorite Pets: 0")

    visit "/pets"

    expect(page).to have_content("Favorite Pets: 0")

    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content("Favorite Pets: 0")
  end

  it "can see all pets that have been favorited" do
    visit "/favorites"

    expect(page).to_not have_content(@pet1.name)
    expect(page).to_not have_content(@pet2.name)

    visit "/pets/#{@pet1.id}"

    click_on "Favorite #{@pet1.name}"

    visit "/favorites"

    expect(page).to have_link(@pet1.name)
    find("img[src*='#{@pet1.image}']")

    visit "/pets/#{@pet2.id}"

    click_on "Favorite #{@pet2.name}"

    visit "/favorites"

    expect(page).to have_link(@pet1.name)
    find("img[src*='#{@pet1.image}']")
    expect(page).to have_link(@pet2.name)
    find("img[src*='#{@pet2.image}']")
  end

  it "links from nav bar to the favorites index page" do
    visit "/shelters"

    click_on "Favorite Pets: 0"

    expect(current_path).to eq("/favorites")

    visit "/pets/#{@pet1.id}"

    click_on "Favorite #{@pet1.name}"

    visit "/favorites"

    click_on "Favorite Pets: 1"

    expect(current_path).to eq("/favorites")
  end

  it "Cannot favoritea pet more than once" do
    visit "/pets/#{@pet1.id}"

    click_on "Favorite #{@pet1.name}"
    expect(page).to_not have_link("Favorite #{@pet1.name}")
    expect(page).to have_link("Remove Favorite")

  end

  it "Can Remove a Pet from Favorites list" do
    visit "/pets/#{@pet1.id}"

    click_on "Favorite #{@pet1.name}"
    expect(page).to have_content("Favorite Pets: 1")

    click_on "Remove Favorite"

    expect(current_path).to eq("/pets/#{@pet1.id}")
    expect(page).to have_content("#{@pet1.name} has been removed from Favorites")
    expect(page).to have_link("Favorite Pet")
    expect(page).to have_content("Favorite Pets: 0")
  end

  it "Can remove a favorite pet from favorite index page" do
    visit "/pets/#{@pet1.id}"

    click_on "Favorite #{@pet1.name}"
    click_on "Favorite Pets: 1"

    expect(current_path).to eq("/favorites")
    within("#favorite-#{@pet1.id}") do
      click_on "Remove #{@pet1.name}"
    end
    expect(current_path).to eq("/favorites")
    within("#allFavoritePets") do
      expect(page).to_not have_content("#{@pet1.name}")
    end
    expect(page).to have_content("Favorite Pets: 0")
  end

  it "if no pets have been favorited, it will see a message indicating that no pets have been favorite" do
    visit "/favorites"

    expect(page).to have_content("You have no favorited pets")
    expect(page).to have_content("Favorite Pets: 0")
  end

  it "Can remove all favorited pets from the index, with a button" do
    visit "/pets/#{@pet1.id}"
    click_on "Favorite #{@pet1.name}"

    visit "/pets/#{@pet2.id}"
    click_on "Favorite #{@pet2.name}"

    visit "/favorites"

    click_on "Remove All Favorites"

    expect(current_path).to eq("/favorites")
    expect(page).to have_content("You have no favorited pets")
    expect(page).to have_content("Favorite Pets: 0")
  end
end
