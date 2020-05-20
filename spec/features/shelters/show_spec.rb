require 'rails_helper'

describe "Shelters show page", type: :feature do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @review1 = @shelter1.reviews.create!(title: "Great Shelter", rating: "4.5", content: "I had an amazing experience", picture: nil)
    @review2 = @shelter1.reviews.create!(title: "Amazing Rescue", rating: "5", content: "Super friendly staff", picture: "https://imgur.com/rjS5VMO")
  end



  it "Can see a single shelter" do

    visit "shelters/#{@shelter1.id}"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.address)
    expect(page).to have_content(@shelter1.city)
    expect(page).to have_content(@shelter1.state)
    expect(page).to have_content(@shelter1.zip)
  end

  it "can update a shelter's information" do

    visit "shelters/#{@shelter1.id}"
    click_on "Update Shelter"

    expect(page).to have_content("Edit Shelter")

    fill_in "Address", with: "2000 Puppy Dr."

      click_on "Update Shelter"

    expect(page).to have_content("2000 Puppy Dr.")
  end

  it "can delete a shelter" do

    visit "shelters/#{@shelter1.id}"

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to have_content(@shelter2.name)
    expect(page).to_not have_content("Pups for You")
  end

  it "can see a list of reviews" do
    visit "shelters/#{@shelter1.id}"

    expect(page).to have_content(@review1.title)
    expect(page).to have_content(@review2.title)
    expect(page).to have_content(@review1.rating)
    expect(page).to have_content(@review2.rating)
    expect(page).to have_content(@review1.content)
    expect(page).to have_content(@review2.content)
    expect(page).to have_content(@review1.picture)
    find("img[src*='https://imgur.com/rjS5VMO']")

    # expect(page).to have_css("img[src*=#{@review2.picture}]")
  end

  it "can see a link to add a review" do
  visit "shelters/#{@shelter1.id}"

  click_on "New Review"
  expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews/new")

  fill_in :title, with: "Good Shelter"
  fill_in :rating, with: "4"
  fill_in :content, with: "Caring people"
  click_on "Submit Review"

  expect(current_path).to eq("/shelters/#{@shelter1.id}")

  review = Review.last
  within("#review-#{review.id}") do
    expect(page).to have_content("Good Shelter")
    expect(page).to have_content("4")
    expect(page).to have_content("Caring people")
    # save_and_open_page
    end
  end

  it "can edit a review" do
    visit "shelters/#{@shelter1.id}"

    within("#review-#{@review1.id}") do
      click_on "Edit Review"
    end

    fill_in :title, with: "Sample Title"
    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    within("#review-#{@review1.id}") do
      expect(page).to have_content("Sample Title")
      expect(page).to have_content("I had an amazing experience")
    end
  end

  it "can not edit a review if the user fails to enter a tile, rating, or content" do
    visit "shelters/#{@shelter1.id}"

    within("#review-#{@review1.id}") do
      click_on "Edit Review"
    end

    fill_in :title, with: ""
    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/#{@review1.id}/edit")
    expect(page).to have_content("Review not updated: Need to fill in title, rating, and content in order to edit a shelter review")
  end

  it "can delete a review" do
    visit "shelters/#{@shelter1.id}"

    within("#review-#{@review1.id}") do
      click_on "Delete Review"
    end

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    expect(page).to_not have_content("Great Shelter")
    expect(page).to_not have_content("I had an amazing experience")
    expect(page).to have_content("Amazing Rescue")
    expect(page).to have_content("Super friendly staff")
  end


end
