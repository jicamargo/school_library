# person.rb

#
# Interface Class Nameable, for decorator design
#
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

#
# Class representing a person in the library application
#
class Person < Nameable
  attr_accessor :name, :age
  attr_writer :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
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

# Concrete Decorators
# call the wrapped object and alter its result in some way.
#
# Decorator class: CapitalizeDecorator
#
class CapitalizeDecorator < PersonDecorator
  def correct_name
    @person.correct_name.capitalize
  end
end

# Concrete Decorators
# call the wrapped object and alter its result in some way.
#
# Decorator class: TrimmerDecorator
# makes sure that the output of correct_name has a maximum of 10 characters.
#
class TrimmerDecorator < PersonDecorator
  def correct_name
    name = @person.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
