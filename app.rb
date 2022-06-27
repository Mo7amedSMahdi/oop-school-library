require "./book"
require "./rental"
require "./student"
require "./teacher"
require "./persons_manager"
require "./book_manager"
require "./rental_manager"

class App
  def initialize
    @people = PersonsManager.new
    @books = BookManager.new
    @rentals = RentalManager.new(book: @books, person: @people)
  end

  #=====Main functionality=====#
  def check_option(option)
    case option
    when "1"
      @books.display_books
    when "2"
      @people.display_persons
    when "3"
      @rentals.display_rentals
    when "4"
      @books.insert_book
    when "5"
      @rentals.insert_rental
    when "6"
      @people.insert_person
    else
      puts "Thank you for using this App."
      exit
    end
  end

  def show_menu
    loop do
      puts "\n\nHello, Please choose an option selecting a number:"
      puts "1) List all Books\n2) List all People\n3) List all rentals for a given person id\n4) Create a Book\n"
      puts "5) Create a Rental\n6) Create a Person\n7) Exit"
      option = gets.chomp
      break if option == "7"

      check_option(option)
    end
  end
end
