class PeopleManager
  attr_accessor :list_people

  def initialize()
    @list_people = []
  end

  def display_people
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
    puts "Press 1 to return..."
    option = gets.chomp
    nil if option == "1"
  end

  def insert_person
    puts "which kind of person want to registered ? [1: Student 2: Teacher 3: Cancel]"
    option = gets.chomp
    case option
    when "1"
      insert_student
    when "2"
      insert_teacher
    else
      puts "Please choose a valid option"
      insert_person
    end
  end

  def insert_student
    print "Insert Name:"
    name = gets.chomp
    print "Insert Age:"
    age = gets.chomp
    print "Has permission? [y, n] "
    permission = gets.chomp
    permission = permission == "y"
    student = Student.new(name: name, age: age, parent_permission: permission)
    @list_people.push(student)
    puts "Student created Succesfully, need to insert another person? [1: yes 2: no]"
    option = gets.chomp
    insert_person if option == "1"
    nil
  end

  def insert_teacher
    print "Insert Name: "
    name = gets.chomp
    print "Insert Age: "
    age = gets.chomp
    print "Insert Specialization: "
    spec = gets.chomp
    parent_auto = true
    @list_people.push(Teacher.new(age: age, name: name, specialization: spec, parent_permission: parent_auto))
    puts "Teacher created Succesfully, need to insert another person? [1: yes 2: no]"
    option = gets.chomp
    insert_person if option == "1"
    nil
  end
end
