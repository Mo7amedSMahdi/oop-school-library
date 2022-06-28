require 'json'
require './book'
require './student'
require './teacher'
require './rental'

class JsonAccessor
  def initialize(type)
    @type = type
  end

  def read_file
    if File.exist?("#{@type}.json")
      data = File.read("#{@type}.json")
      return JSON.parse(data)
    end
    []
  end

  def create_book_list(array_hash)
    array_hash.map { |book| Book.new(id: book['id'], title: book['title'], author: book['author']) }
  end

  def create_person_list(array_hash)
    array_hash.map do |person|
      if person['type'] == 'Student'
        Student.new(id: person['id'], name: person['name'], age: person['age'],
                    parent_permission: person['permissions'])
      else
        Teacher.new(
          id: person['id'],
          name: person['name'],
          age: person['age'],
          parent_permission: person['permissions'],
          specialization: person['specialization']
        )
      end
    end
  end

  def create_rental_list(array_hash, list_books, list_people)
    array_hash.map do |rental|
      Rental.new(rental['date'], list_books.detect { |b| b.id == rental['book'] }, list_people.detect do |p|
                                                                                     p.id == rental['person']
                                                                                   end)
    end
  end

  def fetch_data(list_people = [], list_books = [])
    array_hash = read_file
    return [] if array_hash.empty?

    data_array = []
    case @type
    when 'books'
      data_array = create_book_list(array_hash)
    when 'person'
      data_array = create_person_list(array_hash)
    when 'rental'
      data_array = create_rental_list(array_hash, list_books, list_people)
    end
    data_array
  end

  def store_data(data)
    json_array = []
    case @type
    when 'books'
      data.each { |book| json_array.push(book_to_json(book)) }
    when 'person'
      data.each do |person|
        jsn = person_to_json(person)
        json_array.push(jsn)
      end
    when 'rental'
      data.each { |rental| json_array.push(rental_to_json(rental)) }
    end
    File.write("#{@type}.json", "[#{json_array.join(',')}]")
  end

  def book_to_json(book)
    { title: book.title, author: book.author, id: book.id }.to_json
  end

  def person_to_json(person)
    if person.is_a?(Student)
      { id: person.id, name: person.name, age: person.age, permissions: person.parent_permission,
        type: person.class }.to_json
    else
      {
        id: person.id,
        name: person.name,
        age: person.age,
        permissions: person.parent_permission,
        specialization: person.specialization,
        type: person.class
      }.to_json
    end
  end

  def rental_to_json(rental)
    { date: rental.date, book: rental.book.id, person: rental.person.id }.to_json
  end
end
