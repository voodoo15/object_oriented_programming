#Exercise 1
#Name:  Arnold Redoblado
#Date:  2016-03-24
#Purpose:  Creating three classes (Person, Student, instructor) and through inheritance
#          be able to call via child object.

class Person

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}."
  end
  
end

class Student < Person

  def learn
    puts "I get it!"
  end

end

class Instructor < Person

  def teach
    puts "Everything in Ruby is an Object."
  end

end

instructor = Instructor.new("Chris")
instructor.greeting

student = Student.new("Cristina")
student.greeting

instructor.teach

#Below statement won't work because Student class does not have the teach method.
#Instructor class has the teach method.  Student object is child of student class.
student.teach
