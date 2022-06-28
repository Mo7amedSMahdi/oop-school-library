require './book'

describe Book do
  context 'testing Book class' do
    book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', id: 1)
    it 'Book title should return The Great Gatsby' do
      expect(book.title).to eq 'The Great Gatsby'
    end

    it 'Book author should return F. Scott Fitzgerald' do
      expect(book.author).to eq 'F. Scott Fitzgerald'
    end
  end
end
