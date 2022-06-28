require './capitalize_decorator'
require './trimmer_decorator'
require './person'

describe CapitalizeDecorator do
  context 'testing Capitalizer class' do
    it 'should return MOHAMMED' do
      person = Person.new(name: 'mohammed', age: 20, id: 1, parent_permission: true)
      capitalizer = CapitalizeDecorator.new(person)
      expect(capitalizer.correct_name).to eq 'MOHAMMED'
    end
  end
end

describe TrimmerDecorator do
  context 'testing trimmer class' do
    it 'should return mohammed20' do
      person = Person.new(name: 'mohammed2012', age: 20, id: 1, parent_permission: true)
      capitalizer = TrimmerDecorator.new(person)
      expect(capitalizer.correct_name).to eq 'mohammed20'
    end
  end
end
