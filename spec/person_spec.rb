require './person'

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
  end
end
