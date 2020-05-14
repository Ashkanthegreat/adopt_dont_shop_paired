class Favorite

  attr_reader :favorite_pets

  def initialize(initial_favorite_pets)
    @favorite_pets = initial_favorite_pets || Array.new(0)
  end

  def total_count
    @favorite_pets.length
  end

  def add_pet(id)
    @favorite_pets << id
  end
end
