class BookManager
  def initialize
    @list_books = []
  end

  def display_books
    if @list_books.empty?
      puts "There's no books registered, need to insert a new book?, [1: yes 2: no]"
    else
      puts 'List of books:'
      @list_books.each { |b| puts "Title: #{b.title} Author: #{b.author}" }
      puts 'Add another Book ? [1:yes no:2]'
    end
    option = gets.chomp
    insert_book if option == '1'
    nil
  end

  def insert_book
    print 'Insert Title: '
    title = gets.chomp
    print 'Insert Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @list_books.push(new_book)
    puts 'Book created Succesfully, need to add another book?, [1: yes 2: no]'
    option = gets.chomp
    insert_book if option == '1'
    nil
  end
end
