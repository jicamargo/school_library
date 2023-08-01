# teacher.rb

require_relative 'person'

#
# Class representing a teacher in the library application
#
class Teacher < Person
  attr_reader :specialization

  def initialize(id, age, specialization, name = 'Teacher name missing')
    super(id, age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
