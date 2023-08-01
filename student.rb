# student.rb

require_relative 'person'

#
# Class representing a student in the library application
#
class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Student name missing', parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
