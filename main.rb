require_relative 'test_app'

def clear_console
  if RUBY_PLATFORM =~ /win32|win64|x64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

def print_menu
  puts "\n\n> > > > WELCOME TO LIBRARY APP < < < <\n\n"
  puts "  1. List all books"
  puts "  2. List all people"
  puts "  3. Create a person"
  puts "  4. Create a book"
  puts "  5. Create a rental"
  puts "  6. List rentals for a person"
  puts "  7. Exit\n\n\n"
  print "  Please enter a number [1..7] to select an option: "
end

def press_enter_to_continue
  puts "\nPress Enter to continue..."
  gets
end

def main
  app = App.new

  loop do
    clear_console
    print_menu
    choice = gets.chomp.to_i
    puts "\n"

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      puts " < < < Goodbye! > > >"
      break
    else
      puts " Invalid choice. Please try again (a number from 1 to 7)."
    end
    press_enter_to_continue
  end
end

main if __FILE__ == $PROGRAM_NAME
