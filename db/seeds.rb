require 'faker'

puts "Cleaning all DB"
Answer.destroy_all
Atribution.destroy_all
Course.destroy_all
Lesson.destroy_all
Modul.destroy_all
Question.destroy_all
Requirement.destroy_all
Section.destroy_all
Teacher.destroy_all
User.destroy_all
puts "DB cleanded!"

puts "Creating new DB!"

