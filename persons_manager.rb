require './student'
require './teacher'
require './person_data'

class PersonsManager
  attr_reader :list_people

  def initialize(person_accessor)
    @list_people = person_accessor.fetch_data
    @person_data = PersonData.new
  end

  def display_persons
    if @list_people.any? == false
      puts "There's no people registered. Press 1 to return to menu."
    else
      @list_people.each do |person|
        if person.is_a?(Student)
          puts " [Student] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
        else
          puts " [Teacher] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
        end
      end
    end
    puts 'Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end

  def insert_person
    puts 'which kind of person want to registered ? [1: Student 2: Teacher 3: Cancel]'
    option = gets.chomp
    case option
    when '1'
      insert_student
    when '2'
      insert_teacher
    else
      puts 'Please choose a valid option'
      insert_person
    end
  end

  def insert_student
    user_inputs = @person_data.student_data
    student = Student.new(name: user_inputs[:name], age: user_inputs[:age],
                          parent_permission: user_inputs[:permission], id: 0)
    @list_people.push(student)
    puts 'Student created Succesfully, Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end

  def insert_teacher
    user_inputs = @person_data.teacher_data
    @list_people.push(
      Teacher.new(
        age: user_inputs[:age],
        name: user_inputs[:name],
        specialization: user_inputs[:specialization],
        parent_permission: user_inputs[:permission],
        id: 0
      )
    )
    puts 'Teacher created Succesfully, Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end
end
