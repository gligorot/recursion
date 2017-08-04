def factorial_recursive(x)
  return x if x == 1
  x = x * factorial_recursive(x-1)
end

puts factorial_recursive(5) # => 120
#first try

def palindrome(string)
  if string[0] == string[-1] && string.length <= 2
    return true
  elsif string[0] == string[-1] && string.length > 2
    palindrome(string[1..-2])
  end
end

puts "palindrome" if palindrome("poop") # => "palindrome"
puts "fake" if palindrome("poor") #should not execute

=begin
Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".
=end

def beer_print(n)
  if n > 0
    puts "#{n} bottles of beer on the wall"
    beer_print(n-1)
  else
    puts "no more bottles of beer on the wall"
  end
end

beer_print(3) # => n, n-1..no more bottles of beer on the wall
#first try

=begin
Define a recursive function that takes an argument n and returns the fibonacci value of that position. The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.
=end

def fib_position(n)
  a = 0
  b = 1
  n -= 1
  while n >= 0
    a += b
    n -= 1
    num = a if n == 0
    b += a
    n -= 1
    num = b if n == 0
  end

  puts num
end

def fib(n) #COPIED FROM CODEQUIZ, STILL DON'T UNDERSTAND ????
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

puts fib_position(6) #non recursive solution # => 8
puts fib(6) # => 8

=begin
Define a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and
[[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].
=end


def flatten(array, result = []) # defining result here is the KEY
  array.each do |element|
    if element.is_a? Array #.is_a? same with .kind_of?
      flatten(element, result)
    else
      result << element
    end
  end
  result
end

#again i don't understand this really well

ary = [[1, [8, 9]], [3, 4]]
print flatten(ary, []) # => [1,8,9,3,4]

=begin
Convert an integer to a roman numeral (with the letters)"
=end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

puts integer_to_roman(roman_mapping, 1900, result="") # => MCM

#again copied, didn't solve it by myself...but i get it now which is nice

=begin
convert a roman number to an integer
=end

number_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_integer(number_mapping, str, result = 0)
  return result if str.empty?
  number_mapping.keys.each do |roman|
    if str.start_with?(roman)
      result += number_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_integer(number_mapping, str, result)
    end
  end
end

puts roman_to_integer(number_mapping, "MCM", result = 0)

#semi get-it yet again
