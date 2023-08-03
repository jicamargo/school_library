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
    books.each.with_index do |book, index|
      title = book.title.ljust(20, ' ')
      author = book.author.ljust(20, ' ')
      puts "#{index + 1} -> #{title} Author:#{author}"
    end
  end

  def list_people(title = 'List of People')
    print_title(title) unless title.empty?
    people = @library.list_people
    people.each.with_index { |person, index| print_person(person, index) }
  end

  def print_person(person, index)
    class_name = person.class.name.ljust(7)
    id = person.id.to_s.ljust(4, ' ')
    name = person.name.ljust(20)
    age = person.age.to_s.rjust(2, ' ')

    puts "#{index + 1} - [#{class_name}] ID:#{id} Name:#{name} Age:#{age}"
  end

  def create_person
    print_title('Create a Person')
    type = person_type
    case type
    when 'T', 'S'
      create_person_by_type(type)
    else
      puts "\n Invalid person type."
    end
  end

  def create_person_by_type(type)
    name = person_name
    age = person_age
    save_person(type, name, age)
  end

  def save_person(type, name, age)
    if type == 'T'
      specialization = teacher_specialization
      create_teacher(name, age, specialization)
    else
      permission = parent_permission
      create_student(name, age, permission)
    end
  end

  def person_type
    print 'Enter person type (T -> teacher or S -> student): '
    gets.chomp.upcase
  end

  def person_name
    print 'Enter name: '
    gets.chomp.upcase
  end

  def person_age
    print 'Enter age: '
    gets.chomp.to_i
  end

  def parent_permission
    print 'Does the student have parent permission? (Y / N): '
    gets.chomp.upcase == 'Y'
  end

  def teacher_specialization
    print 'Enter teacher specialization: '
    gets.chomp.to_i
  end

  def create_teacher(name, age, specialization)
    @library.create_teacher(name, age, specialization)
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
    print "\nEnter number of the book to rent: "
    book_index = gets.chomp.to_i
    book = @library.list_books[book_index - 1]
    person = select_person('Who wants to rent the book?')
    @library.create_rental(book, person)
  end

  def select_person(title = 'Select a Person')
    puts "#{title}\n\n"
    list_people('')
    print "\nEnter the number of the person (not ID): "
    person_index = gets.chomp.to_i

    people = @library.list_people
    people[person_index - 1]
  end

  def list_rentals_for_person
    print_title('List Rentals for Person')
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    rentals = @library.list_rentals_for_person(person_id)
    display_rentals(person_id, rentals)
  end

  def display_rentals(person_id, rentals)
    return if rentals.nil?

    if rentals.empty?
      puts 'This person has no rentals.'
    else
      puts "___ List of Rentals for ID: #{person_id} ___\n\n"
      rentals.each { |rental| puts "Title:#{rental.book.title.ljust(20, ' ')} Date:#{rental.date}" }
    end
  end
end
