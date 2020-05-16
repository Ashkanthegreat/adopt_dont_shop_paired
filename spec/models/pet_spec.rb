require 'rails_helper'

describe Pet, type: :model do
  describe "relationships" do
    it {should have_many :pet_applications}
    it {should have_many(:applications).through(:pet_applications)}
  end
end
