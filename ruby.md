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
