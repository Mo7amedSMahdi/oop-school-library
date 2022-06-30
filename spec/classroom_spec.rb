require './class_room'
require './student'

describe ClassRoom do
  context 'testing ClassRoom class' do
    classroom = ClassRoom.new(label: 'History')
    student = Student.new(name: 'Martin', age: 20, id: 1, parent_permission: true)
    classroom.add_students(student)

    it 'should have a label' do
      expect(classroom.label).to eq(label: 'History')
    end

    it 'should have at least one student' do
      expect(classroom.students.length).to eq(1)
    end

    it 'should have a student' do
      student_obj = classroom.students.first
      expect(student_obj.name).to eq(student.name)
    end
  end
end
