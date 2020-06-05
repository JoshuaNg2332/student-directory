@students = [] # An empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # get the first name
  name = STDIN.gets.chomp
  # While the name is not empty, repeate this code
  while !name.empty? do
    # Add the student hash to the array
    #@students << {name: name, cohort: :november}
    making_list(name)
    puts "Now we have #{@students.count} students"
    # Get another name from the user
    name = STDIN.gets.chomp
  end
  # Return the array of students
  @students
end

def print_header
puts "The students of Villains Academy"
puts "----------------------"
end

def print_students_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}.  #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students!"
end
# Nothing happens until we call the methods

def interactive_menu
  loop do
    print_menu
    menu(STDIN.gets.chomp)
  end
end

def menu(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then user_load_selection
  when "9" then exit
  else
    puts "I don't know what you meant, try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  puts "Enter the name you would like for your list:"
  file_input = gets.chomp + ".csv"
  # open the file for writing
  file = File.open(file_input, "w")
  # iterate over the array of students
  @students.each do |student|
    #student_data = [student[:name], student[:cohort]]
    #csv_line = student_data.join(",")
    #file.puts csv_line
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
  puts "You have succesfully saved your list to students.csv."
end

def user_load_selection
  puts Dir["/Users/joshng/projects/student-directory/*.csv"]
  load_students(gets.chomp)
end

def load_students(filename)
  #filename = user_selection
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    making_list(name)
    #@students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "You have succesfully loaded your list from students.csv."
end

def default_file_startup
  #filename = ARGV.first # first argument from the command line
  #return if filename.nil?
  #filename = "students.csv" if filename.nil? # get out of the method if it isn't given
  ARGV.first.nil? ? filename = "students.csv" : filename = ARGV.first
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


def making_list(name)
  @students << {name: name, cohort: :november}
end


default_file_startup
interactive_menu