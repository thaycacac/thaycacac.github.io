## Casting

### Casting to a Float

```ruby
"123.50".to_f #=> 123.5
Float("123.50") #=> 123.5
```

### Casting to a String

```ruby
123.5.to_s #=> "123.5"
String(123.5) #=> "123.5"
```

```ruby
sprintf("%s", 123.5) #=> "123.5"
"%s" % 123.5 #=> "123.5"
"%d" % 123.5 #=> "123"
"%.2f" % 123.5 #=> "123.50"
```

### Casting to an Integer

```ruby
"123.50".to_i #=> 123
Integer("123.50") #=> 123
```

### Floats and Integers

```ruby
1.0 / 2 #=> 0.5 
1.to_f / 2 #=> 0.5 
1 / Float(2) #=> 0.5
1.fdiv 2 # => 0.5
```

## Operators

### Operator Precedence and Methods

```ruby
class Foo
  def **(x)
    puts "Raising to the power of #{x}"
  end
  def <<(y)
    puts "Shifting left by #{y}"
  end
  def !
    puts "Boolean negation"
  end
end
Foo.new ** 2 Foo.new << 3 !Foo.new
```

```ruby
class Foo
  def [](x)
    puts "Looking up item #{x}"
  end
  def []=(x,y)
    puts "Setting item #{x} to #{y}"
  end
end
f = Foo.new
f[:cats] = 42 #=> "Setting item cats to 42" 
f[17] #=> "Looking up item 17"
```

```ruby
class Foo
  def -@
    puts "unary minus" end
  def +@
    puts "unary plus"
  end
end
f = Foo.new
+f #=> "unary plus"
-f #=> "unary minus"
```

```ruby
class Foo
  def ==(x)
    puts "checking for EQUALITY with #{x}, returning false"
    false
  end
end
f = Foo.new
x = (f == 42) #=> "checking for EQUALITY with 42, returning false"
puts x #=> "false"
x = (f != 42) #=> "checking for EQUALITY with 42, returning false"
puts x #=> "true"

class Foo
  def !=(x)
    puts "Checking for INequality with #{x}"
  end
end
f != 42 #=> "checking for INequality with 42"
```

### Case equality operator (===)

```ruby
(1..5) === 3 # => true
(1..5) === 6 # => false
Integer === 42 # => true
Integer === 'fourtytwo'# => false
/ell/ === 'Hello' # => true
/ell/ === 'Foobar'# => false
```

### Safe Navigation Operator

```ruby
# Bad
if house && house.address && house.address.street_name
  house.address.street_name
end

# Good
if house&.address&.street_name
  house.address.street_name
end
```

### Assignment Operators

```ruby
x, y = 3, 9
x, y = y, x
puts "x is #{x}, y is #{y}" # => x is 9, y is 3
```

### Comparison Operators

## Variable Scope and Visibility

### Class Variables

```ruby
class Dinosaur
  @@classification = "Like a Reptile, but like a bird"
  def self.classification
    @@classification
  end
  def classification
    @@classification
  end
end
dino = Dinosaur.new
dino.classification
# => "Like a Reptile, but like a bird"
Dinosaur.classification
# => "Like a Reptile, but like a bird"
```

```ruby
class TRex < Dinosaur
  @@classification = "Big teeth bird!"
end
TRex.classification
# => "Big teeth bird!"

Dinosaur.classification
# => "Big teeth bird!"
```

```ruby
module SomethingStrange
  @@classification = "Something Strange"
end
class DuckDinosaur < Dinosaur
  include SomethingStrange
end
DuckDinosaur.class_variables # => [:@@classification]
SomethingStrange.class_variables # => [:@@classification]
DuckDinosaur.classification # => "Big teeth bird!"
```

### Local Variables

```ruby
def some_method
  method_scope_var = "hi there"
  p method_scope_var
end
some_method
# hi there
# => hi there
method_scope_var
# NameError: undefined local variable or method `method_scope_var'
```

## Arrays

### Create Array of Strings

```ruby
array = %w(one two three four)
array = ['one', 'two', 'three', 'four']
```

### Create Array with Array::new

```ruby
Array.new 3 #=> [nil, nil, nil]
Array.new 3, :x #=> [:x, :x, :x]
Array.new(3) { |i| i.to_s } #=> ["0", "1", "2"]
b = Array.new(3) { "X" }
b[1].replace "C"
```

### Create Array of Symbols

```ruby
array = %i(one two three four)
```

### Manipulating Array Elements

```ruby
[1, 2, 3] << 4
# => [1, 2, 3, 4]

[1, 2, 3].push(4) # => [1, 2, 3, 4]

[1, 2, 3].unshift(4) # => [4, 1, 2, 3]

[1, 2, 3] << [4, 5]
# => [1, 2, 3, [4, 5]]

array = [1, 2, 3, 4] array.pop
# => 4

array
# => [1, 2, 3]

array = [1, 2, 3, 4] array.shift
# => 1
array
# => [2, 3, 4]

array = [1, 2, 3, 4] array.delete(1)
# => 1
array
# => [2, 3, 4]

array = [1,2,3,4,5,6]
array.delete_at(2) // delete from index 2 # => 3
array
# => [1,2,4,5,6]

array = [1, 2, 2, 2, 3]
array - [2]
# => [1, 3] # removed all the 2s array - [2, 3, 4]
# => [1] # the 4 did nothing

[1, 2, 3] + [4, 5, 6]
# => [1, 2, 3, 4, 5, 6]
[1, 2, 3].concat([4, 5, 6]) # => [1, 2, 3, 4, 5, 6]
[1, 2, 3, 4, 5, 6] - [2, 3] # => [1, 4, 5, 6]
[1, 2, 3] | [2, 3, 4] # => [1, 2, 3, 4]
[1, 2, 3] & [3, 4] # => [3]

[1, 2, 3] * 2
# => [1, 2, 3, 1, 2, 3]
```

### Accessing elements

```ruby
%w(a b c)[0] # => 'a'
%w(a b c)[1] # => 'b'

%w(a b c d)[1..2] # => ['b', 'c'] (indices from 1 to 2, including the 2) 
%w(a b c d)[1...2] # => ['b'] (indices from 1 to 2, excluding the 2)

%w(a b c)[-1] # => 'c'
%w(a b c)[-2] # => 'b'
%w(a b c d e)[1...-1] # => ['b', 'c', 'd']
[1, 2, 3, 4].first # => 1
[1, 2, 3, 4].first(2) # => [1, 2]
[1, 2, 3, 4].last # => 4
[1, 2, 3, 4].last(2) # => [3, 4]
[1, 2, 3, 4].sample # => 3
[1, 2, 3, 4].sample # => 1
[1, 2, 3, 4].sample(2) # => [2, 1]
[1, 2, 3, 4].sample(2) # => [3, 4]
```

### Creating an Array with the literal constructor [ ]

```ruby
array = [1, 2, 3, 4]
array = [1, 'b', nil, [3, 4]]
```

### Decomposition

```ruby
arr = [1, 2, 3] # ---
a = arr[0]
b = arr[1]
c = arr[2]
# --- or, the same 
a, b, c = arr

a, *b = arr # a = 1; b = [2, 3]
a, *b, c = arr # a = 1; b = [2]; c = 3
a, b, c, *d = arr # a = 1; b = 2; c = 3; d = []
a, *b, *c = arr # SyntaxError: unexpected *
```

```ruby
arr = [1, [2, 3, 4], 5, 6]
a, (b, *c), *d = arr # a = 1; b = 2; c = [3, 4]; d = [5, 6]
```

### Arrays union, intersection and difference

```ruby
x = [5, 5, 1, 3] y = [5, 2, 4, 3]
x|y
=> [5, 1, 3, 2, 4]
x&y
=> [5, 3]
x-y => [1]
```

### Remove all nil elements from an array with #compact

```ruby
array = [ 1, nil, 'hello', nil, '5', 33] array.compact # => [ 1, 'hello', '5', 33]
#notice that the method returns a new copy of the array with nil removed,
#without affecting the original
array = [ 1, nil, 'hello', nil, '5', 33]
#If you need the original array modified, you can either reassign it array = array.compact # => [ 1, 'hello', '5', 33]
array = [ 1, 'hello', '5', 33]
#Or you can use the much more elegant 'bang' version of the method array = [ 1, nil, 'hello', nil, '5', 33]
array.compact # => [ 1, 'hello', '5', 33]
array = [ 1, 'hello', '5', 33]
```

### Get all combinations / permutations of an array

```ruby
[1,2,3].permutation
[1,2,3].permutation.to_a
[1,2,3].permutation(2).to_a [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]] [1,2,3].permutation(4).to_a [] -> No permutations of length 4
```

```ruby
[1,2,3].combination(1) #<Enumerator: [1,2,3]:combination [1,2,3].combination(1).to_a [[1],[2],[3]] [1,2,3].combination(3).to_a [[1,2,3]] [1,2,3].combination(4).to_a [] -> No combinations of length 4
```

### Inject, reduce

```ruby
[1,2,3].reduce(0) {|a,b| a + b} # => 6
[1,2,3].reduce {|a,b| a + b} # => 6
[1,2,3].reduce(0, :+) # => 6
[1,2,3].reduce(:+) # => 6
```

### Filtering arrays

#### Select

```ruby
array = [1, 2, 3, 4, 5, 6]
array.select { |number| number > 3 } # => [4, 5, 6]
```

#### Reject

```ruby
array = [1, 2, 3, 4, 5, 6]
array.reject { |number| number > 3 } # => [1, 2, 3]
```

### #map

```ruby
[1, 2, 3].map { |i| i * 3 } # => [3, 6, 9]
['1', '2', '3', '4', '5'].map { |i| i.to_i } # => [1, 2, 3, 4, 5]
```

```ruby
# call to_i method on all elements
%w(1 2 3 4 5 6 7 8 9 10).map(&:to_i) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# using proc (lambda) on all elements
%w(1 2 3 4 5 6 7 8 9 10).map(&->(i){ i.to_i * 2}) # => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```

### Arrays and the splat (*) operator

```ruby
def wrap_in_array(value) [*value]
end
wrap_in_array(1) #> [1]
wrap_in_array([1, 2, 3]) #> [1, 2, 3]
wrap_in_array(nil) #> []
```

### Two-dimensional array

```ruby
array = Array.new(3) { Array.new(4) { 0 } }
```

### Turn multi-dimensional array into a one- dimensional (flattened) array

```ruby
[1, 2, [[3, 4], [5]], 6].flatten # => [1, 2, 3, 4, 5, 6]
```

### Get unique array elements

```ruby
a = [1, 1, 2, 3, 4, 4, 5]
a.uniq
#=> [1, 2, 3, 4, 5]
```

### Create Array of numbers

```ruby
numbers = Array(1..10) # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers = (1..10).to_a # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

### Create an Array of consecutive numbers or letters

```ruby
(1..10).to_a #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a_range = 1...5
a_range.to_a #=> [1, 2, 3, 4]

```

### Cast to Array from any object

```ruby
def join_as_string(arg)
if arg.instance_of?(Array)
arg.join(',')
elsif arg.instance_of?(Range)
arg.to_a.join(',') else
arg.to_s end
end
join_as_string('something') join_as_string([2, 1, 5]) join_as_string(1) join_as_string(2..4) join_as_string([]) join_as_string(nil)
#=> "something"
#=> "2,1,5"
#=> "1"
#=> "2,3,4"
#=> ""
#=> ""
```

## String

### Difference between single-quoted and double-quoted String literals

```ruby
# Single-quoted strings don't support interpolation
puts 'Now is #{Time.now}' # Now is #{Time.now}
# Double-quoted strings support interpolation
puts "Now is #{Time.now}"
# Now is 2016-07-21 12:43:04 +0200
```

```ruby
puts 'Hello\nWorld' # Hello\nWorld
puts "Hello\nWorld" # Hello
# World
```

### Creating a String

```ruby
s1 = 'Hello'
s2 = "Hello"
%(A string) %{A string} %<A string> %|A string| %!A string!
```

### Case manipulation

```ruby
"string".upcase
"STRING".downcase "String".swapcase "string".capitalize # => "String"
```

### String concatenation

```ruby
s1 = "Hello"
s2 = " "
s3 = "World"
puts s1 + s2 + s3
# => Hello World
s = s1 + s2 + s3 puts s
# => Hello World
```

### Positioning strings

```ruby
str ="abcd"
str.ljust(4) => "abcd" str.ljust(10) => "abcd 
str = "abcd"
str.rjust(4) => "abcd" str.rjust(10) => " abcd"
str = "abcd"
str.center(4) => "abcd" str.center(10) => " abcd "
```

### Splitting a String

```ruby
"alpha,beta".split(",")
# => ["alpha", "beta"]
```

### String starts with

```ruby
str = "zebras are cool"
str.start_with?("zebras") => true
```

```ruby
str = "zebras are cool"
str.index("zebras").zero? => true
```

### Joining Strings

```ruby
["alpha", "beta"].join(",") # => "alpha,beta"
["alpha", "beta"].join # => "alphabeta"
```

### String ends with

```ruby
str = "I like pineapples" str.end_with?("pineaaples") => false
```

### String Substitution

```ruby
p "This is %s" % "foo" # => "This is foo"
p "%s %s %s" % ["foo", "bar", "baz"] # => "foo bar baz"
p "%{foo} == %{foo}" % {:foo => "foo" } # => "foo == foo"
```

### String character replacements

```ruby
"string".tr('r', 'l') # => "stling"
"string ring".sub('r', 'l') # => "stling ring"
"string ring".gsub('r','l') # => "stling ling"
```

### Understanding the data in a string

```ruby
"abc".bytes # => [97, 98, 99] "abc".encoding.name # => "UTF-8"
```

## DateTime

### DateTime from string

```ruby
DateTime.parse('Jun, 8 2016')
# => #<DateTime: 2016-06-08T00:00:00+00:00 ((2457548j,0s,0n),+0s,2299161j)> DateTime.parse('201603082330')
# => #<DateTime: 2016-03-08T23:30:00+00:00 ((2457456j,84600s,0n),+0s,2299161j)> DateTime.parse('04-11-2016 03:50')
# => #<DateTime: 2016-11-04T03:50:00+00:00 ((2457697j,13800s,0n),+0s,2299161j)> DateTime.parse('04-11-2016 03:50 -0300')
# => #<DateTime: 2016-11-04T03:50:00-03:00 ((2457697j,24600s,0n),-10800s,2299161j)
```
### New

```ruby
DateTime.new(2014,10,14)
# => #<DateTime: 2014-10-14T00:00:00+00:00 ((2456945j,0s,0n),+0s,2299161j)>
DateTime.now
# => #<DateTime: 2016-08-04T00:43:58-03:00 ((2457605j,13438s,667386397n),-10800s,2299161j)>
```

### Add/subtract days to DateTime

```ruby
DateTime.new(2015,12,30,23,0) + 1
# => #<DateTime: 2015-12-31T23:00:00+00:00 ((2457388j,82800s,0n),+0s,2299161j)>
DateTime.new(2015,12,30,23,0) + 2.5
# => #<DateTime: 2016-01-02T11:00:00+00:00 ((2457390j,39600s,0n),+0s,2299161j)>
DateTime.new(2015,12,30,23,0) + Rational(1,2)
# => #<DateTime: 2015-12-31T11:00:00+00:00 ((2457388j,39600s,0n),+0s,2299161j)>
DateTime.new(2015,12,30,23,0) - 1
# => #<DateTime: 2015-12-29T23:00:00+00:00 ((2457388j,82800s,0n),+0s,2299161j)>
DateTime.new(2015,12,30,23,0) - 2.5
DateTime.new(2015,12,30,23,0) - Rational(1,2)
# => #<DateTime: 2015-12-30T11:00:00+00:00 ((2457387j,39600s,0n),+0s,2299161j)>
```

## Time

### How to use the strftime method

```ruby
Time.now.strftime("%Y-%m-d %H:%M:S") #=> "2016-07-27 08:45:42"

Time.now.strftime("%F %X") #=> "2016-07-27 08:45:42"
```

### Creating time objects

```ruby
Time.new(2010, 3, 10) #10 March 2010 (Midnight)
Time.new(2015, 5, 3, 10, 14) #10:14 AM on 3 May 2015
Time.new(2050, "May", 3, 21, 8, 16, "+10:00") #09:08:16 PM on 3 May 2050

Time.now.to_i # => 1478633386
Time.at(1478633386) # => 2016-11-08 17:29:46 -0200
```

## Numbers

### Converting a String to Integer

```ruby
Integer("123") Integer("0xFF") Integer("0b100") Integer("0555")
# => 123
# => 255
# => 4
# => 365
"23".to_i
"23-hello".to_i
"hello".to_i
# => 23
# => 23
# => 0
```

### Creating an Integer

```ruby
0 # creates the Fixnum 0
123 # creates the Fixnum 123
1_000 # creates the Fixnum 1000. You can use _ as separator for readability
```

### Rounding Numbers

```ruby
4.89.round 4.25.round 3.141526.round(1) 3.141526.round(2) 3.141526.round(4)
# => 5
# => 4
# => 3.1
# => 3.14
# => 3.1415

4.9999999999999.floor # => 4

4.0000000000001.ceil # => 5
```

### Even and Odd Numbers

```ruby
4.even? # => true 5.even? # => false
4.odd? # => false 5.odd? # => true
```

### Rational Numbers

```ruby
r1 = Rational(2, 3)
r2 = 2.5.to_r
r3 = r1 + r2
r3.numerator # => 19 r3.denominator # => 6 Rational(2, 4) # => (1/2)
Rational('2/3') Rational(3) Rational(3, -5) Rational(0.2) Rational('0.2') 0.2.to_r 0.2.rationalize '1/4'.to_r
# => (2/3)
# => (3/1)
# => (-3/5)
# => (3602879701896397/18014398509481984)
# => (1/5)
# => (3602879701896397/18014398509481984)
# => (1/5)
# => (1/4)
```

### Complex Numbers

```ruby
1i # => (0+1i)
1.to_c # => (1+0i)
rectangular = Complex(2, 3) # => (2+3i)
polar = Complex('1@2') # => (-0.4161468365471424+0.9092974268256817i)
```

### Converting a number to a string

```ruby
2.to_s(2)
3.to_s(2)
3.to_s(3) 10.to_s(16) # => "a"
```

### Dividing two numbers

```ruby
3 / 2 # => 1
3 / 3.0 # => 1.0
```

## Symbols

### Creating a Symbol

```ruby
:a_symbol # => :a_symbol :a_symbol.class # => Symbol
```

### Converting a String to Symbol

```ruby
s.to_sym
# => :something
:"#{s}"
# => :something
```

### Converting a Symbol to String

```ruby
s = :something
s.to_s
# => "something"
```

## Comparable

### Rectangle comparable by area

```ruby
class Rectangle include Comparable
def initialize(a, b) @a = a
@b = b end
def area @a * @b
end
def <=>(other)
area <=> other.area
end end
r1 = Rectangle.new(1, 1) r2 = Rectangle.new(2, 2) r3 = Rectangle.new(3, 3)
r2 >= r1 # => true r2.between? r1, r3 # => true r3.between? r1, r2 # => false
```

## Control Flow

### if, elsif, else and end

```ruby
status = if age < 18 :minor
else
:adult
end
```

### Case statement

```ruby
case x when 1,2,3
puts "1, 2, or 3" when 10
puts "10" else
puts "Some other number" end

case x
when 1,2,3 then puts "1, 2, or 3" when 10 then puts "10"
else puts "Some other number"
end
```

### Truthy and Falsy values

 two values which are considered "falsy"
 
 - nil
 - false

### Inline if/unless

```ruby
puts "x is less than 5" if x < 5
```

### while, until

```ruby
i= 0
while i < 5
puts "Iteration ##{i}"
i +=1 end

i= 0
until i == 5
puts "Iteration ##{i}"
i +=1 end
```

### Flip-Flop operator

```ruby
(1..5).select do |e|
e if (e == 2) .. (e == 4)
end
# => [2, 3, 4]
``

### Or-Equals/Conditional assignment operator (||=)

### unless 

```ruby
# Prints not inclusive
unless 'hellow'.include?('all') puts 'not inclusive'
end
```

### throw, catch

```ruby
catch(:out) do
  catch(:nested) do
puts "nested" end
puts "before"
throw :out
puts "will not be executed"
end
puts "after"
# prints "nested", "before", "after"
```

### Ternary operator

```ruby
value = true
value ? "true" : "false" #=> "true"
value = false
value ? "true" : "false" #=> "false"
```

### Loop control with break, next, and redo

```ruby
actions = %w(run jump swim exit macarena) index = 0
while index < actions.length action = actions[index]
break if action == "exit"
index += 1
puts "Currently doing this action: #{action}" end
# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
```

```ruby
actions = %w(run jump swim sleep macarena) index = 0
repeat_count = 0
while index < actions.length
action = actions[index]
puts "Currently doing this action: #{action}"
if action == "sleep" repeat_count += 1
redo if repeat_count < 3
end
index += 1 end
# Currently doing this action: run
# Currently doing this action: jump
# Currently doing this action: swim
# Currently doing this action: sleep
# Currently doing this action: sleep
# Currently doing this action: sleep
# Currently doing this action: macarena
```

```ruby
even_value = for value in [1, 2, 3] break value if value.even?
end
puts "The first even value is: #{even_value}"
```

### return vs. next: non-local return in a block

```ruby
def foo
bar = [1, 2, 3, 4].map do |x|
return 0 if x.even?
x
end
puts 'baz'
bar
end
foo # => 0
```

### begin, end

```ruby
begin
a= 7 b= 6 a*b
end
```

### Control flow with logic statements

```ruby
File.exist?(filename) or STDERR.puts "#{filename} does not exist!"
```
