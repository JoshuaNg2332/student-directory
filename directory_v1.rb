def input_students
  puts "Please enter the names of the students and their cohort".center(40)
  puts "To finish, just enter 'stop'".center(40)
  # Create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # While the name is not empty, repeate this code
  while name != "stop" do
    # Add the student hash to the array
    if name.empty? && cohort.empty?
      name = "Unknown"
      cohort = "Unknown"
    elsif name.empty?
      name = "Unknown"
    elsif cohort.empty?
      cohort = "Unkown"
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students".center(40)
    # Get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
puts "The students of Villains Academy"
puts "----------------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_cohort(students)
  puts "Which cohort would you like to see?"
  choice = gets.chomp.to_sym
  $s = students.map { |student| puts student[:name] if student[:cohort] == choice }
  puts $s
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students!"
end
# Nothing happens until we call the methods

students = input_students

print_header
print(students)
print_cohort(students)
print_footer(students)

