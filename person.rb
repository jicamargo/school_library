# person.rb

require_relative 'nameable'

#
# Class representing a person in the library application
#
class Person < Nameable
  attr_accessor :name, :age
  attr_writer :id
  attr_reader :rentals

  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
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

  # Instead of setter for entire collection a method to add one by one
  def rental=(rental)
    @rentals << rental
    rental.person = self
  end

  # Method to add a rental for this person
  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def of_age?
    @age.to_i >= 18
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
