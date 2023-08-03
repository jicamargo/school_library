# app.rb

require_relative 'library'

# General method to print a title
def print_title(title)
  puts "\n_____ #{title} _____\n\n"
end

# This class is responsible for the user interface and for
# calling the methods of the Library class.
class App
  def initialize
    @library = Library.new
  end

  def list_books(title = 'List of Books')
    print_title('List of Books') unless title.empty?
    books = @library.list_books
    books.each.with_index { |book, index| puts "#{index + 1} -> #{book.title}, Author: #{book.author}" }
  end

  def list_people(title = 'List of People')
    print_title(title) unless title.empty?
    people = @library.list_people
    people.each.with_index { |person, index| puts "#{index + 1} -> #{person.name} (#{person.class.name})" }
  end

  def create_person
    print_title('Create a Person')
    type = person_type
    name = person_name
    age = person_age
    save_person(type, name, age)
  end

  def save_person(type, name, age)
    case type
    when 'T'
      create_teacher(name, age)
    when 'S'
      permission = parent_permission
      create_student(name, age, permission)
    else
      puts "\n Invalid person type."
    end
  end

  def person_type
    print 'Enter person type (T -> teacher or S -> student): '
    gets.chomp.upcase
  end

  def person_name
    print 'Enter person name: '
    gets.chomp.upcase
  end

  def person_age
    print 'Enter person age: '
    gets.chomp.to_i
  end

  def parent_permission
    print 'Does the student have parent permission? (Y / N): '
    gets.chomp.upcase == 'Y'
  end

  def create_teacher(name, age)
    @library.create_teacher(name, age)
  end

  def create_student(name, age, permission)
    @library.create_student(name, age, permission)
  end

  def create_book
    print_title('Create a Book')
    print 'Enter book title : '
    title = gets.chomp.upcase
    print 'Enter book author: '
    author = gets.chomp.upcase
    @library.create_book(title, author)
  end

  def create_rental
    print_title('Create a Rental')
    puts "Which book do you want to rent?\n\n"
    list_books('')
    print "\nEnter the number of the book to rent: "
    book_index = gets.chomp.to_i
    book = @library.list_books[book_index - 1]
    person = select_person('Who wants to rent the book?')
    @library.create_rental(book, person)
  end

  def list_rentals_for_person
    print_title('List Rentals for Person')
    person = select_person

    if person.nil?
      puts 'Person not found.'
      return
    end

    rentals = @library.list_rentals_for_person(person)
    display_rentals(person, rentals)
  end

  def select_person(title = 'Select a Person')
    puts "#{title}\n\n"
    list_people('')
    print "\nEnter the number of the person to see their rentals: "
    person_index = gets.chomp.to_i

    people = @library.list_people
    people[person_index - 1]
  end

  def display_rentals(person, rentals)
    if rentals.empty?
      puts 'This person has no rentals.'
    else
      puts "___ List of Rentals for #{person.name} (#{person.class.name}) ___\n\n"
      rentals.each { |rental| puts "#{rental.book.title} (#{rental.date})" }
    end
  end
end
