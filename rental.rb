# rental.rb

#
# Purpose: Rental class
#
class Rental
  attr_accessor :date
  attr_reader :book
  attr_reader :person

  def initialize(date, book, person)
    @date = date

    # many to many relationship between book and person, using a join class (rental)
    #
    # setter for book (a rental can only belong to one book)
    @book = book
    book.rentals << self

    # setter for person (a rental can only belong to one person)
    @person = person
    person.rentals << self
  end
end
