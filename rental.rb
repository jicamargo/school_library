# rental.rb

#
# Purpose: Rental class
#
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    # many to many relationship between book and person, using a join class (rental)
    #
    # setter for book (a rental can only belong to one book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)

    # setter for person (a rental can only belong to one person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end

  # Instead of setter for entire collection a method to add one by one
  def book=(book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

  # Instead of setter for entire collection a method to add one by one
  def person=(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
