# clasroom.rb
#
# Purpose: Classroom class
#
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Instead of setter for entire collection a method to add one by one
  def add_student(student)
    @students << student
    student.classroom = self
  end
end
