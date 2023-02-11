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

