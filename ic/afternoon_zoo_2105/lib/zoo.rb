class Zoo
  attr_reader :name,
              :street,
              :city,
              :state,
              :zip_code,
              :inventory,
              :address

  def initialize(name, street, city, state, zip_code)
    @name      = name
    @street    = street
    @city      = city
    @state     = state
    @zip_code  = zip_code
    @inventory = []
    @address   = "#{street} #{city}, #{state} #{zip_code}"
  end

  def animal_count
    @inventory.count
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animals_older_than(age)
    @inventory.find_all do |animal|
      animal if animal.age_in_days >= age * 7
    end
  end

  def total_weight_of_animals
    total_weight = @inventory.map do |animal|
      animal.weight.to_i
    end
    total_weight.sum
  end

  def details
    details = {
      'total_weight' => total_weight_of_animals,
      'street_address' => @street
    }
  end

  def animals_sorted_by_weight
    sorted_animals = @inventory.sort_by do |animal|
      animal.weight.to_i
    end
    sorted_animals.reverse
  end

  def animal_hash
    animal_hash = Hash.new(0)
    @inventory.group_by do |hash|
      hash.kind.chars[0]
    end
  end
end
