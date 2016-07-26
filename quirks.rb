#Ruby is a multi-paradigm language, but mainly object-orientated. It is general purpose.

#Often people, especially computer engineers, focus on the machines.
#They think, "By doing this, the machine will run fast. By doing this, the machine will run more effectively.
#By doing this, the machine will something something something."
#They are focusing on machines.
#But in fact we need to focus on humans, on how humans care about doing programming or
#operating the application of the machines.
#We are the masters. They are the slaves.

#-Yukihiro Matsumoto (source: wikipedia)



#Basic classes in Ruby
class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
end

#Inheritance
class Square < Rectangle
  #Class variables
  @@sides = 4
  def initialize(side)
    #This looks odd!
    @length = @breadth = side
  end
  #ONE way to access instance variables from
  attr_reader :length
  attr_reader :breadth
  #Interesting way to set vars... '=' is part of method name
  def length= new_length
    @length = new_length
  end
end

#p or puts? p is result of "inspect" method, puts is "to_s" method. Both are similar.
puts Square.new(3).length
p Square.new(5).breadth

square = Square.new(4)
p square.length
square.length = 5
p square.length

#????
p 1.is_a?(String) ? "1 is a string" : "1 is not a string"

#Break the language
class Fixnum
  def + num
    42
  end
end

p 1 + 1

#Fix the language
class Fixnum
  def + num
    self - -num
  end
end

p 5 + 6

#hash literals and hash equality
h = {'first_name' => 1, 2 => 'Lastname', foo: 'bar'}
j = {2 => 'Lastname', 'first_name' => 1, :foo => 'bar'}

#It's Javascript!!
k = {
  look: 'at',
  this: 'syntax'
}

p k

p h == j
p h[2]
p h[:foo]
p j[:foo]

#Ruby array methods are truely outrageous!

p [nil, nil, 1, nil, 2, 3].compact


#class instance vars, boring. However use them over class vars
class Foo
  @foo_count = 0

  def self.increment_counter
    @foo_count += 1
  end

  def self.current_count
    @foo_count
  end
end

class Bar < Foo
  @foo_count = 100
end

Foo.increment_counter
Bar.increment_counter
p Foo.current_count
p Bar.current_count