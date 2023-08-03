# trimmer_decorator.rb

require_relative 'person_decorator'

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
