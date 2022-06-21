require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @id = Random.rand(1..1000)
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? or parent_permission

    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
