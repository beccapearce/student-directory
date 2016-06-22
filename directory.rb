#a method to get the student names and cohort from the user
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array in which to put the student names
  students = []
  #get the input of the name from the user
  name = gets.chomp
    puts "What cohort is #{name} in?"
    cohort = gets.chomp
    #Default to July if no cohort is entered
    cohort = :July if cohort.empty?
    #continue asking for input until the user enters a blank (presses enter twice)
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    if !name.empty?
      puts "What cohort is #{name} in?"
      cohort = gets.chomp
      cohort = :July if cohort.empty?
    end
  end
  students
end

#A method to introduce our list of students
def print_header
  puts "The students of Makers Academy".center(50)
  puts "-----------------------------------------------------------"
end

#A method to print out the names of the students whose name is less than 12 chara
def print_students(students)
  index = 0
  while index < students.length
  students.each do |student|
    puts "#{student[:name]} is from the #{student[:cohort]} cohort".center(50)
    index += 1
  end
  end
end

#A method to show the overall number of students from the list
def print_footer(students)
  puts "------------------------------------------------------------"
  puts " Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_students(students)
print_footer(students)
