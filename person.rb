require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :id, :parent_permission
  attr_reader :rentals

  def initialize(age:, name:, id:, parent_permission: true)
    super()
    @name = name
    @age = age
    @id = id.zero? ? Random.rand(1..1000) : id
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return true if of_age? or parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
