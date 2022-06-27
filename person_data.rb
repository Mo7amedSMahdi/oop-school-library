class PersonData
  def student_data
    print 'Insert Name:'
    name = gets.chomp
    print 'Insert Age:'
    age = gets.chomp
    print 'Has permission? [y, n] '
    permission = gets.chomp
    permission = permission == 'y'
    { name: name, age: age, permission: permission }
  end

  def teacher_data
    print 'Insert Name: '
    name = gets.chomp
    print 'Insert Age: '
    age = gets.chomp
    print 'Insert Specialization: '
    spec = gets.chomp
    { name: name, age: age, permission: true, specialization: spec }
  end
end
