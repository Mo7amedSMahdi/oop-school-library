class BookManager
  attr_reader :list_books

  def initialize(book_accessor)
    @list_books = book_accessor.fetch_data
  end

  def display_books
    if @list_books.empty?
      puts "There's no books registered please add some books."
    else
      puts 'List of books:'
      @list_books.each { |b| puts "Title: #{b.title} Author: #{b.author}" }
    end
    puts 'Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end

  def insert_book
    print 'Insert Title: '
    title = gets.chomp
    print 'Insert Author: '
    author = gets.chomp
    new_book = Book.new(title: title, author: author, id: 0)
    @list_books.push(new_book)
    puts 'Book created Succesfully, Press 1 to return...'
    option = gets.chomp
    nil if option == '1'
  end
end
