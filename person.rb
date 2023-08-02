# person.rb

require_relative 'nameable'

#
# Class representing a person in the library application
#
class Person < Nameable
  attr_accessor :name, :age
  attr_writer :id
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
