class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end

  def can_build?(craft)
    @supplies >= craft.supplies_required
  end
end
