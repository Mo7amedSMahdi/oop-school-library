require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @list_books = []
    @list_people = []
    @list_rentals = []
  end

  #=====Persons=====#
  def list_people
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
      puts 'Press 1 to return'
    end
    option = gets.chomp
    show_menu unless option != '1'
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
      show_menu
    end
  end

  def insert_student
    print 'Insert Name:'
    name = gets.chomp
    print 'Insert Age:'
    age = gets.chomp
    print 'Has permission? [y, n] '
    permission = gets.chomp
    permission = permission == 'y'
    student = Student.new(name: name, age: age, parent_permission: permission)
    @list_people.push(student)
    puts 'Student created Succesfully'
    show_menu
  end

  def insert_teacher
    print 'Insert Name: '
    name = gets.chomp
    print 'Insert Age: '
    age = gets.chomp
    print 'Insert Specialization: '
    spec = gets.chomp
    parent_auto = true
    @list_people.push(Teacher.new(age: age, name: name, specialization: spec, parent_permission: parent_auto))
    puts 'Teacher created Succesfully'
    show_menu
  end

  #=====Books=====#

  def list_books
    if @list_books.empty?
      puts "There's no books registered, Press 1 to return to menu."
      selected = gets.chomp
      show_menu if selected == '1'
    else
      puts 'List of books:'
      @list_books.each { |b| puts "Title: #{b.title} Author: #{b.author}" }
      puts 'Add another Book ? [1:yes no:2]'
      option = gets.chomp
      option == '1' ? insert_book : show_menu
    end
  end

  def insert_book
    print 'Insert Title: '
    title = gets.chomp
    print 'Insert Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @list_books.push(new_book)
    puts 'Book created Succesfully'
    show_menu
  end

  #=====Rentals=====#

  def list_rental
    if @list_books.any? == false || @list_people.any? == false
      puts 'Sorry, but you have to create a person and book first.'
    else
      print 'Please, Insert person ID: '
      person_id = gets.chomp.to_i
      new_arr_rentals = @list_rentals.select { |r| r.person.id == person_id }
      puts 'Rentals:'
      new_arr_rentals.each { |r| puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" }
    end
    show_menu
  end

  def insert_rental
    puts 'Select One of the people bellow by number (not ID):'
    @list_people.each_with_index { |p, i| puts "#{i}) Name: #{p.name} ID: #{p.id} Age: #{p.age}" }
    idx_person = gets.chomp.to_i
    #====choose book=====#
    puts 'Select One of the books bellow by number:'
    @list_books.each_with_index { |b, i| puts "#{i}) Title: #{b.title} Author: #{b.author}" }
    idx_book = gets.chomp.to_i
    puts 'Please, Insert the Date:'
    date = gets.chomp
    @list_rentals.push(Rental.new(date, @list_books[idx_book], @list_people[idx_person]))
    puts 'Rental registered successfully'
    show_menu
  end

  #=====Main functionality=====#
  def check_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      list_rental
    when '4'
      insert_book
    when '5'
      insert_rental
    when '6'
      insert_person
    else
      puts 'Thank you for using this App.'
      exit
    end
  end

  def show_menu
    puts "\n\nHello, Please choose an option selecting a number:"
    puts "1) List all Books\n2) List all People\n3)  List all rentals for a given person id\n4) Create a Book\n"
    puts "5) Create a Rental\n6) Create a Person\n7) Exit"
    option = gets.chomp
    check_option(option)
  end
end
