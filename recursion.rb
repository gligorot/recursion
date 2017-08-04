

def fibs (n, a=0, b=1)
  n.times do
    if n > 0
      print a
      n -= 1
      a += b
    end
    if n > 0
      print b
      n -= 1
      b += a
    end
  end
  puts #needed for clearness of output
end

#TESTS
fibs (1) # => 0
fibs (2) # => 0, 1 (01)
fibs (3) # => 0, 1, 1 (011)
fibs (4) # => 0, 1, 1, 2 (0112)
fibs (5) # => 0, 1, 1, 2, 3 (01123)
fibs (8) # => 0, 1, 1, 2, 3, 5, 8, 13 (011235813)

def fibs_rec(n, a=0, b=1)

  if n == 1
    1 #TIL return 1 != 1 ....like wtf
  elsif n == 0
    0
  elsif n < 0
    return
  end

  if a < b
    print a
    a+=b
  else
    print b
    b+=a
  end

  fibs_rec(n-1, a, b)
end
#i'm not sure how but it works haha....GG

#TESTS
puts fibs_rec (0) # => 0
puts fibs_rec (1) # => 0, 1 (01)
puts fibs_rec (2) # => 0, 1, 1 (011)
puts fibs_rec (3) # => 0, 1, 1, 2 (0112)
puts fibs_rec (4) # => 0, 1, 1, 2, 3 (01123)
puts fibs_rec (7) # => 0, 1, 1, 2, 3, 5, 8, 13 (011235813)
