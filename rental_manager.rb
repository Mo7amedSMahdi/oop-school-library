class RentalManager
  def initialize(book:, person:)
    @list_rentals = []
    @person_manager = person
    @books_manager = book
  end

  def display_rentals
    if @books_manager.list_books.any? == false || @person_manager.list_people.any? == false
      puts "Sorry, but you have to create a person and book first."
      puts "Enter 1 to return to menu"
      option = gets.chomp
      return nil if option == "1"
    else
      print "Please, Insert person ID: "
      person_id = gets.chomp.to_i
      new_arr_rentals = @list_rentals.select { |r| r.person.id == person_id }
      puts "Rentals:"
      new_arr_rentals.each { |r| puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" }
    end
    puts "Add new redcord? [1: yes 2: no]"
    option = gets.chomp
    insert_rental if option == "1"
    nil
  end

  def insert_rental
    puts "Select One of the people bellow by number (not ID):"
    @person_manager.list_people.each_with_index { |p, i| puts "#{i}) Name: #{p.name} ID: #{p.id} Age: #{p.age}" }
    idx_person = gets.chomp.to_i
    #====choose book=====#
    puts "Select One of the books bellow by number:"
    @books_manager.list_books.each_with_index { |b, i| puts "#{i}) Title: #{b.title} Author: #{b.author}" }
    idx_book = gets.chomp.to_i
    puts "Please, Insert the Date:"
    date = gets.chomp
    @list_rentals.push(Rental.new(date, @books_manager.list_books[idx_book], @person_manager.list_people[idx_person]))
    puts "Rental registered successfully, Add new redcord? [1: yes 2: no]"
    option = gets.chomp
    insert_rental if option == "1"
    nil
  end
end
