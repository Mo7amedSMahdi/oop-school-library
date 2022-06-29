class RentalManager
  attr_reader :list_rentals

  def initialize(book:, person:, rental_accessor:)
    @list_rentals = rental_accessor.fetch_data(person.list_people, book.list_books)
    @person_manager = person
    @books_manager = book
  end

  def display_rentals
    if @books_manager.list_books.any? == false || @person_manager.list_people.any? == false
      puts 'Sorry, but you have to create a person and book first.'
    else
      print 'Please, Insert person ID: '
      person_id = gets.chomp.to_i
      new_arr_rentals = @list_rentals.select { |r| r.person.id == person_id }
      puts 'Rentals:'
      new_arr_rentals.each { |r| puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" }
    end
    puts 'Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end

  def insert_rental
    puts 'Select One of the people bellow by number (not ID):'
    @person_manager.list_people.each_with_index { |p, i| puts "#{i}) Name: #{p.name} ID: #{p.id} Age: #{p.age}" }
    idx_person = gets.chomp.to_i
    puts 'Select One of the books bellow by number:'
    @books_manager.list_books.each_with_index { |b, i| puts "#{i}) Title: #{b.title} Author: #{b.author}" }
    idx_book = gets.chomp.to_i
    puts 'Please, Insert the Date:'
    date = gets.chomp
    @list_rentals.push(Rental.new(date, @books_manager.list_books[idx_book], @person_manager.list_people[idx_person]))
    puts 'Rental registered successfully, Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end
end
