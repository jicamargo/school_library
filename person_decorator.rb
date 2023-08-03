# person_decorator.rb

require_relative 'nameable'

#
# Base decorator class
#
class PersonDecorator < Nameable
  attr_accessor :person

  def initialize(person)
    super()
    @person = person
  end

  # The Decorator delegates all work to the wrapped component (person)
  def correct_name
    @person.correct_name
  end
end
