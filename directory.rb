

#a method to get the student names and cohort from the user
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array in which to put the student names
  students = []
  #get the input of the name from the user
  name = gets.chomp.to_sym
    puts "What cohort is #{name} in?"
    cohort = gets.chomp.to_sym
    #Default to MysteryCohort if no cohort is entered
    cohort = "Unknown cohort" if cohort.empty?
    #continue asking for input until the user enters a blank (presses enter twice)
  while !name.empty?
    students << {name => cohort}
    case
    when students.count == 1
        puts "Now we have #{students.count} student"
      when students.count >= 2
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp.to_sym
    if !name.empty?
      puts "What cohort is #{name} in?"
      cohort = gets.chomp.to_sym
      cohort = "Unknown cohort" if cohort.empty?
    end
  end
  students
end

#A method to introduce our list of students
def print_header
  puts "The students of Makers Academy".center(50)
  puts "-----------------------------------------------------------"
end

#A method to print out the names of the students in order of their cohorts
def print_students(students)
  students = students.sort_by{|hash| hash[:name]}
  students.each do |hash|
    hash.each do |name, cohort|
      puts "#{name} is in the #{cohort} cohort"
    end
  end
end

#A method to show the overall number of students from the list
def print_footer(student)
  puts "------------------------------------------------------------"
  if student.count == 1
    puts " Overall, we have #{student.count} great student"
  else
    puts " Overall, we have #{student.count} great students"
  end
end

student_cohort_array_of_hashes = input_students
if !student_cohort_array_of_hashes.empty?
  print_header
  print_students(student_cohort_array_of_hashes)
  print_footer(student_cohort_array_of_hashes)
else
  puts "You have not entered any students"
end
