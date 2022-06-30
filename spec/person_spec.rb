require './person'
require './book'
require './rental'

describe Person do
  context 'testing Person class' do
    person = Person.new(name: 'David', age: 20, id: 1, parent_permission: true)
    it 'Person name should be David' do
      expect(person.name).to eq('David')
    end

    it 'Person age should be 20' do
      expect(person.age).to eq(20)
    end

    it 'Person id should be 1' do
      expect(person.id).to eq(1)
    end

    it 'Person parent_permission should be true' do
      expect(person.parent_permission).to eq(true)
    end

    it 'The can_use_services? method returns false if under age and no parent permission' do
      new_person = Person.new(age: 14, name: 'Rose', parent_permission: false, id: 0)
      expect(new_person.can_use_services?).to be false
    end

    it 'The can_use_services? method returns true if over age' do
      new_person = Person.new(age: 19, name: 'Sam', parent_permission: false, id: 0)
      expect(new_person.can_use_services?).to be true
    end

    it 'The can_use_services? method returns true if has parent permission' do
      new_person = Person.new(age: 14, name: 'Rose', parent_permission: true, id: 2)
      expect(new_person.can_use_services?).to be true
    end
  end
end
