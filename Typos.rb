def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #Create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #Get another name from the user
    name = gets.chomp
  end
    #return the array of students
  students
end


puts input_students
