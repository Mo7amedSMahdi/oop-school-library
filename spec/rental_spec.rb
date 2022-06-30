require './rental'
require './person'
require './book'

describe Rental do
  context 'testing Rental class' do
    book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', id: 1)
    person = Person.new(name: 'David', age: 20, id: 1, parent_permission: true)
    rental = Rental.new('12-4-2020', book, person)

    it 'should have a title' do
      expect(rental.book.title).to eq('The Great Gatsby')
    end

    it 'person name should be David' do
      expect(rental.person.name).to eq('David')
    end
  end
end
