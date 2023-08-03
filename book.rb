# book.rb

require_relative 'rental'

#
# Purpose: Book class
#
class Book
  attr_accessor :title, :author
  attr_reader :rentals
  attr_writer :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  # Instead of setter for entire collection a method to add one by one
  def rental=(rental)
    @rentals << rental
    rental.book = self
  end

  # Method to add a rental for this book
  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
