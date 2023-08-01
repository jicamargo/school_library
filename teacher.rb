# teacher.rb

require_relative 'person'

class Teacher < Person
  attr_reader :specialization
  
  def initialize(id, age, name = "Unknown", specialization)
    super(id, age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
