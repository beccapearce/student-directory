def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array in which to put the student names
  students = []
  #get the input of the name from the user
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :July}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

#A method to introduce our list of students
def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

#A method to print out the names of the students
def print_students(students)
  students.each do |student|
    if student[:name].each_char.first == "T"
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
   end
  end
end

#A method to show the overall number of students from the list
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_students(students)
print_footer(students)
