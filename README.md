
 Curriculum
 Users
 Events
 Referrals
 Arnold Redoblado
Assignments
Lessons
Checkpoints
Students
Progress
Staff
Job Postings
Companies
More Jobs!
Students
Courses
 Web Development
Edit Profile
Log Out
Object Oriented Programming

Article Submissions
Submitting

Create a git repository on GitHub, called "object_oriented_programming" or similar. Clone it onto your own computer. The assignment will walk you through creating Ruby programs and adding those files to the repository. If you're stuck, you can refer back to this Submissions Cheat Sheet.

Have fun and don't forget to work alongside a partner!

What You Will Learn

Ruby is pure object-oriented language and everything appears to Ruby, as an object. Every value in Ruby is an object, even the most primitive things: strings, numbers and even true and false. Even a class itself is an object that is an instance of the Class class. This assignment will take you through all the major functionalities related to Object Oriented Ruby.

Develop an understanding of the following concepts:

How to start writing proper OO code in Ruby
Understanding classes, inheritance, modules, namespacing
Assignments
Required Reading
Exercise 1
Exercise 2
Stretch Exercise
Required Reading on Objects, Classes, Inheritance and Modules

What are Objects and Classes?

An object-oriented program involves classes and objects. A class is the blueprint from which individual objects are created. In object-oriented terms, we say that your bicycle is an instance of the class of objects known as bicycles.

Take the example of any vehicle. It comprises wheels, horsepower, and fuel or gas tank capacity. These characteristics form the data members of the class Vehicle. You can differentiate one vehicle from the other with the help of these characteristics.

A vehicle can also have certain functions, such as halting, driving, and speeding. Even these functions form the data members of the class Vehicle. You can, therefore, define a class as a combination of characteristics and functions.

Defining Classes (Objects)

To implement object-oriented programming by using Ruby, you need to first learn how to create objects and classes in Ruby.

A class in Ruby always starts with the keyword class followed by the name of the class. The name should always be in initial capitals. The class Customer can be displayed as:

class Person
end
You terminate a class by using the keyword end. All the data members in the class are between the class definition and the end keyword.

Ruby provides four types of variables:

Local Variables

Local Variables: Local variables are the variables that are defined in a method. Local variables are not available outside the method. You will see more detail about method in subsequent chapter. Local variables begin with a lowercase letter or _.

Instance Variables

Instance Variables: Instance variables are available across methods for any particular instance or object. That means that instance variables change from object to object. Instance variables are preceded by the at sign (@) followed by the variable name.

Class Variables

Class Variables: Class variables are available across different objects. A class variable belongs to the class and is a characteristic of a class. They are preceded by the sign @@ and are followed by the variable name.

Global Variables

Global Variables: Class variables are not available across classes. If you want to have a single variable, which is available across classes, you need to define a global variable. The global variables are always preceded by the dollar sign ($).

Creating Objects (Classes)

jim = Person.new
shelly = Person.new
Class and Instance Methods

Class methods are methods that are called on a class and instance methods are methods that are called on an instance of a class.

Instance Methods

Instance methods only work on an instance and thus you have to create a new instance to use them (Person.new). Again, there are more ways to define instance methods than this, especially if you look into meta programming. The below is an example of an instance method.

class Person
  def hello
    puts "Hello Ruby!"
  end
end
The self Keyword

"self" references what scope you're in your program. For example:

class Person
  puts self
end
# Person
When we output "self" to the screen, it prints "Person". If we were to put self in an instance method, "self" would now point to an instance of Person.

class Person
  def new_method
    self
  end
end
p = Person.new # #<Person:0x007feaf118aef0>
p.new_method # #<Person:0x007feaf118aef0>
Class Methods

The following is an example of a class method. When you see self.method_name it is immediately apparent to me that this is a class method.

So when would you use a class method? Class methods are for anything that does not deal with an individual instance of a class.

class Calculator
  def self.add
    puts "Hello Ruby!"
  end
end
Readers and Writers

Let's say you have a class Person.

class Person
end

person = Person.new
person.name # => no method error
Obviously we never defined method name. Let's do that.

class Person
  def name
    @name # simply returning an instance variable @name
  end
end

person = Person.new
person.name # => nil
person.name = "Dennis" # => no method error
Aha, we can read the name, but that doesn't mean we can assign the name. Those are two different methods. Former called reader and latter called writer. We didn't create the writer yet so let's do that.

class Person
  def name
    @name
  end

  def name=(str)
    @name = str
  end
end

person = Person.new
person.name = 'Dennis'
person.name # => "Dennis"
Awesome. Now we can write and read instance variable @name using reader and writer methods. Except, this is done so frequently, why waste time writing these methods every time? We can do it easier.

class Person
  attr_reader :name
  attr_writer :name
end
Even this can get repetitive. When you want both reader and writer just use accessor!

class Person
  attr_accessor :name
end

person = Person.new
person.name = "Dennis"
person.name # => "Dennis"
Works the same way! And guess what: the instance variable @name in our person object will be set just like when we did it manually, so you can use it in other methods.

class Person
  attr_accessor :name

  def greeting
    "Hello #{@name}"
  end
end

person = Person.new
person.name = "Dennis"
person.greeting # => "Hello Dennis"
That's it. In order to understand how attrreader, attrwriter, and attr_accessor methods actually generate methods for you, read other answers, books, ruby docs.

Modules

(this excerpt is from Ruby Monk)

Ruby modules allow you to create groups of methods that you can then include or mix into any number of classes. Modules only hold behaviour, unlike classes, which hold both behaviour and state.

Since a module cannot be instantiated, there is no way for its methods to be called directly. Instead, it should be included in another class, which makes its methods available for use in instances of that class. There is, of course, more to this story, but let's keep it simple for now.

In order to include a module into a class, we use the method include which takes one parameter - the name of a Module.

module WarmUp
  def push_ups
    "Phew, I need a break!"
  end
end

class Gym
  include WarmUp

  def preacher_curls
    "I'm building my biceps."
  end
end

class Dojo
  include WarmUp

  def tai_kyo_kyu
    "Look at my stance!"
  end
end

gym = Gym.new
dojo = Dojo.new

puts gym.push_ups
puts dojo.push_ups

Modules as Namespaces

(this excerpt is from Ruby Monk)

Namespacing is a way of bundling logically related objects together. Modules serve as a convenient tool for this. This allows classes or modules with conflicting names to co-exist while avoiding collisions. Think of this as storing different files with the same names under separate directories in your filesystem.

Modules can also hold classes. In this example, we'll try and define an Array class under our Perimeter module from the last lesson. Notice how it does not affect Ruby's Array class at all.

module Perimeter
  class Array
    def initialize
      @size = 400
    end
  end
end

our_array = Perimeter::Array.new
ruby_array = Array.new

p our_array.class
p ruby_array.class
We have these two classes alongside each other. This is possible because we've namespaced our version of the Array class under the Perimeter module.

:: is a constant lookup operator that looks up the Array constant only in the Perimeter module.

What happens when we don't namespace our Array class?

class Array
  def initialize
    @size = 400
  end
end

our_array = Array.new

p our_array.class
Because Ruby has open classes, doing this simply extends the Array class globally throughout the program, which is dangerous and of course not our intended behaviour.

The examples above are a bit contrived for the sake of simplicity. The real problem namespacing solves is when you're loading libraries. If your program bundles libraries written by different authors, it is often the case that there might be classes or modules defined by the same name.

Inheritance

Inheritance is a relation between two classes. We know that all cats are mammals, and all mammals are animals. The benefit of inheritance is that classes lower down the hierarchy get the features of those higher up, but can also add specific features of their own. If all mammals breathe, then all cats breathe. In Ruby, a class can only inherit from a single other class. Some other languages support multiple inheritance, a feature that allows classes to inherit features from multiple classes, but Ruby doesn't support this.

We can express this concept in Ruby - see the p033mammal.rb program below:

class Mammal
  def breathe
    puts "inhale and exhale"
  end
end

class Cat < Mammal
  def speak
    puts "Meow"
  end
end

rani = Cat.new
rani.breathe
rani.speak
Class Hierarchy

A part of the class hierarchy is as shown in the figure below.

!Wikipedia

This diagram demonstrates that all objects inherit their methods from "Object".

Exercise 1: Class Time

Create a file called people.rb. Run your program and commit your work after each step.

Let's start by creating two classes: one called Student and another called Instructor.
The student class has a method called learn that outputs "I get it!".
The instructor class has a method called teach that outputs "Everything in Ruby is an Object".
Both the instructor and the student have names. We know that instructors and students are both people. Create a parent Person class that contains the attribute name and an initializer to set the name.
Both the instructor and the student should also be able to do a greeting, like "Hi, my name is #{name}". Where's the best place to put this common method?
Create an instance of Instructor whose name is "Chris" and call his greeting.
Create an instance of Student whose name is "Cristina" and call her greeting.
Call the teach method on your instructor instance and call the learn method on your student. Next, call the teach method on your student instance. What happens? Why doesn't that work? Leave a comment in your program explaining why.
Once you're done, commit and push your work to GitHub!

Exercise 2: Mars Rover

This is a longer problem and recommended for group work. You can all work at your own computers, but talking through this problem as a group will help break it down and solve it. Don't forget to commit early and often!

The Story

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

Imagine a grid that looks something like this:

  _ _ _ _ _ _ _ _ _
9|_|_|_|_|_|_|_|_|_|        N
8|_|_|_|_|_|_|_|_|_|      W   E
7|_|_|_|_|_|_|_|_|_|        S
6|_|_|_|_|_|_|_|_|_|
5|_|_|_|_|_|_|_|_|_|
4|_|_|_|_|_|_|_|_|_|
3|_|_|_|_|_|_|_|_|_|
2|_|_|_|_|_|_|_|_|_|
1|_|_|_|_|_|_|_|_|_|
0 1 2 3 4 5 6 7 8 9

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'.

'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.
'M' means move forward one grid point, and maintain the same heading.
Assume that the square directly North from (x, y) is (x, y+1).

The Setup

Input

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

Your program should accept 5 inputs with gets.

Output

The output for each rover should be its final co-ordinates and heading.

INPUT AND OUTPUT

Test Input:
5 5                  > Our first line is our plateau size. 
1 2 N                > Lines 2 and 3 are paired, with the first being our initial start position and header,
LMLMLMLMM            > and the second line being a series of move and turn instructions.
3 3 E                > Another 2-line pair, 1 pair per rover.
MMRMMRMRRM

Expected Output:
1 3 N                > When rover bot is done doing its instructions, output its current position
5 1 E                > The first line is the first rover, the second line is the next rover
How To Approach This Problem

There's a lot of different aspects to this problem. This is a great opportunity to practice your problem solving skills! The most important step is to start by breaking things down into small pieces and solve one thing at a time.

Given that we're practicing Object-Oriented Programming, we're going to want to focus on identifying different "things" in this program.

What is the easiest "thing" to reason about here? The Rover! We can already start picturing rovers moving across Mars.

As we already know, objects have state and behaviour. In Ruby, our classes have instance variables and methods. What kind of state do we need for our rovers? What about behaviours?

State

x coordinate
y coordinate
direction
Behaviour

read instruction
move
turn
Start by creating a Rover class that has these properties. Given that each rover starts with a location and direction, perhaps it's a good idea to have an initialize method for each rover that accepts these parameters.

Next up we'll need to think about behaviour. Behaviours have the ability to read and affect the state of an object. We express those as methods.

read_instruction should accept an instruction and decide whether to tell the rover to move or turn. It simply delegates to more specific behaviour.

move affects the position of the rover. Depending on current direction and position, you'll need to update the x or y coordinates.

turn affects the direction of the rover. Depending on the current direction of the rover, the new direction will be determined with either turning L or R.

Once you've figured out how to move and turn your rover, the rest gets much easier because you got the seemingly complex stuff out of the way first! All you'll need to figure out from here is how to read and split up the instructions so that you can pass them on to your rovers.

Taking It Further (optional)

Try thinking about other object possibilities, such as a MissionControl object that's responsible for reading and handing the instructions over to the rovers. It could also be responsible for reporting their final states.

Another possibility is a Plateau object. This object could give you perspective of multiple rovers on a given board. This could allow you to write methods to verify if the rovers are trying to move off the board or colliding with one another.

While you're working, Once you're done, commit and push your work to Github!

Exercise 3: Sales Taxes (Stretch Assignment)

This is another great group exercise!

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets...

INPUT:
 
Input 1:
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
 
Input 2:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
 
Input 3:
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
1 box of imported chocolates at 11.25
 
OUTPUT
 
Output 1:
1 book : 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83
 
Output 2:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
 
Output 3:
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
1 imported box of chocolates: 11.85
Sales Taxes: 6.70
Total: 74.68
Once you're done, commit and push your work to github!
