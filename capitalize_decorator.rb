# capitalize_decorator.rb

require_relative 'person_decorator'

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
