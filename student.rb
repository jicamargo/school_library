# student.rb

require_relative 'person'

#
# Class representing a student in the library application
#
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom)
    super(age)
    @classroom = classroom
    @parent_permission = true
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  # setter for classroom (a student can only belong to one classroom)
  def clasroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
