require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name:, parent_permission:, id:)
    super(age: age, name: name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.call(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
