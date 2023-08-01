# teacher.rb

require_relative 'person'

#
# Class representing a teacher in the library application
#
class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization)
    super(age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
