#Outline the names of the students
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"ALex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Kruger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
#A method to introduce our list of students
def print_header
puts "The students of Villains Academy"
puts "-------------"
end

#A method to print out the names of the students
def print_names(names)
  names.each do |name|
    puts name
  end
end

#A method to show the overall number of students from the list
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print_names(students)
print_footer(students)
