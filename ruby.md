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

