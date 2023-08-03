# teacher.rb

require_relative 'person'

#
# Class representing a teacher in the library application
#
class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization = 'Unassigned')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
