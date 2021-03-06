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

  def is_a_favorite?(id)
    @favorite_pets.include?(id)
  end

  def remove_pet(id)
    @favorite_pets.delete(id)
  end

  def remove_all
    @favorite_pets.clear
  end

  def id_to_object
    @favorite_pets.map do |pet_id|
      Pet.find(pet_id)
    end
  end
end
