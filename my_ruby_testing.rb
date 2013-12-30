require 'test/unit'

class IntegerTest < Test::Unit::TestCase

  def test_downto
    assert_block "Couldn't Perform Downto" do
      5.downto(1) {|n| n}
    end
  end

  def test_times
    assert_block "Couldn't Perform times!" do
      5.times do |i|
        i
      end
    end
  end

  def test_upto
    assert_block "Couldn't perform upto!" do
      5.upto(10) { |n| n }
    end
  end

  def test_ceil
    assert_equal(13, 12.0345.ceil)
  end

  def test_chr
    # Returns a string containing the ASCII character represented by the receiver’s value.
    assert_equal("A", 65.chr)
    assert_equal("a", ?a.chr)
  end

  def test_even
    assert_equal(true, 2.even?)
  end

  def test_floor
    assert_equal(12, 12.0345.floor)
  end

  def test_integer?
    assert_equal(false, 12.0345.integer?)
    assert_equal(true, 12.integer?)
  end

  def test_next_succ_for_integers
    # Returns the Integer equal to int + 1.
    assert_equal(2, 1.next)
    assert_equal(0, -1.succ)
  end

  def test_odd
    assert_equal(true, 1.odd?)
  end

  def test_ord
    # returns the int itself
    assert_equal(97, ?a.ord)
  end

  def test_pred
    # Returns the Integer equal to int - 1
    assert_equal(-1, 0.pred)
    assert_equal(99, 100.pred)
  end

  def test_round
    assert_equal(12, 12.0345.round)
    assert_equal(13, 12.6123.round)
  end

  def test_truncate
    assert_equal(12, 12.0345.truncate)
  end

end

class StringTest < Test::Unit::TestCase

  def test_bytes
    assert_equal([72, 101, 108, 108, 111], "Hello".bytes.to_a)
  end

  def test_capitalize
    assert_equal("Hello", "hello".capitalize)
    assert_equal("Hello", "HELLO".capitalize)
    a = "hello"
    assert_equal("Hello", a.capitalize!) # capitalize! modifies the variable a
    assert_equal(nil, a.capitalize!) # capitalize! returns nil because the first letter is already capitalized
  end

  def test_center
    assert_equal("hello", "hello".center(4))
    assert_equal("       hello        ", "hello".center(20))
    assert_equal("1231231hello12312312", "hello".center(20, "123"))
  end

  def test_chars
    assert_equal(["f", "o", "o"], "foo".chars.to_a)
  end

  def test_chomp
    # Returns a new String with the given record separator removed from the end of str (if present).
    # If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is it will remove \n, \r, and \r\n).
    assert_equal("hello", "hello".chomp)
    assert_equal("hello", "hello\n".chomp)
    assert_equal("hello\n", "hello\n\r".chomp)
    assert_equal("hello", "hello\r\n".chomp)
    assert_equal("hello", "hello\r".chomp)
    assert_equal("hello \n there", "hello \n there".chomp)
    assert_equal("he", "hello".chomp("llo"))
  end

  def test_chop
    # Returns a new String with the last character removed. 
    # If the string ends with \r\n, both characters are removed. 
    # Applying chop to an empty string returns an empty string. 
    # String#chomp is often a safer alternative, as it leaves the string unchanged if it doesn’t end in a record separator.
    assert_equal("string", "string\r\n".chop)
    assert_equal("string\n", "string\n\r".chop)
    assert_equal("string", "string\n".chop)
    assert_equal("strin", "string".chop)
    assert_equal("", "x".chop)
  end

  def test_concat
    a = "Hello"
    assert_equal("Hello World", a << " World") # the shovel operator modifies the original string
    assert_equal("Hello World!", a.concat(33))
    assert_equal("Hello World! How are you?", a + " How are you?")
    assert_equal("Hello World! How are you?", a += " How are you?")
  end

  def test_count
    a = "Hello World!"
    assert_equal(5, a.count("lo")) # counts the number of times those letters occur
    assert_equal(2, a.count("lo", "o")) # counts the number of characters between lo and o
    assert_equal(3, a.count("hello", "^l")) # counts all the letters in "hello" except the "l's" becuase the caret (^) negates it
    assert_equal(8, a.count("a-z")) # counts the characters in a given range (similar to regex ranges)
  end

  def test_delete
    a = "Hello World!"
    assert_equal("He Wrd!", a.delete("lo")) # works like count above, but deletes those characters instead
    assert_equal("H W!", a.delete("a-z")) #deletes all of the characters in a range
    assert_equal("Heo Word!", a.delete("l", "lo")) #deletes characters between the given parameters 
    assert_equal("Hell Wrld!", a.delete("aeiou", "^e")) # deletes all lowercase vowels but e due to the carat (^) operator negating the e
  end

  def test_downcase
    assert_equal("hello", "hELLO".downcase)
  end

  def test_empty
    assert_equal(false, "hello".empty?)
    assert_equal(true, "".empty?)
  end

  def test_end_with
    assert_equal(false, "Hello, World!".end_with?("ld"))
    assert_equal(true, "Hello, World!".end_with?("ld!"))
  end

  def test_equal
    assert_equal(false, "Hello, World!".eql?("Hello?"))
    assert_equal(true, "Hello, World!".eql?("Hello, World!"))
  end

  def test_flexible_quotes
    a = %(This works with both ' and ")
    b = %!This works with both ' and "!
    c = %{This works with both ' and "}
    assert_equal(true, a == b)
    assert_equal(true, a == c)
  end

  def test_hash
    # the hash is only constant for the session making it impossible to test
    # assert_equal(172560981, "Hello, World!".hash)
  end

  def test_include
    assert_equal(true, "Hello, World!".include?(","))
    assert_equal(false, "Hello, World!".include?("Bilbo"))
    assert_equal(false, "Hello, World!".include?("hello"))
  end

  def test_index
    assert_equal(0, "Hello, World!".index("H"))
    assert_equal(3, "Hello, World!".index("lo"))
    assert_equal(nil, "Hello, World!".index("a"))
  end

  def test_insert
    assert_equal("Xabcb", "abcb".insert(0, 'X'))
    assert_equal("abcXb", "abcb".insert(3, 'X'))
    assert_equal("abcbX", "abcb".insert(4, 'X'))
  end

  def test_inspect
    # Returns a printable version of str, with special characters escaped.
    str = "Hello"
    # ruby 1.9 changed string number reference to actual strings
    # str[3] = 8
    # now you assign the actual string instead of the number reference like above
    str[3] = "\b"
    assert_equal("\"Hel\\bo\"", str.inspect)
  end

  def test_variable_interpolation
    # Double quoted strings interpolate variables
    a = "The square root of 25 is #{Math.sqrt(25).round}"
    assert_equal("The square root of 25 is 5", a)
  end

  def test_intern_and_to_sym
    assert_equal(:Koala, "Koala".intern)
    s = "cat".to_sym
    assert_equal(true, s == :cat)
    s = '@cat'.to_sym
    assert_equal(true, s == :@cat)
    s = 'cat and dog'.to_sym
    assert_equal(true, s == :"cat and dog")
  end

  def test_length
    s = "Hello, World!"
    assert_equal(13, s.length)
  end

  def test_ljust
    assert_equal("hello", "hello".ljust(4))
    assert_equal("hello               ", "hello".ljust(20))
    assert_equal("hello123412341234123", "hello".ljust(20, "1234"))
  end

  def test_lstrip
    # removes leading whitespace
    assert_equal("hello    ", "    hello    ".lstrip)
    assert_equal("hello", "hello".lstrip)
  end  

  def test_match
    assert_equal("ll", 'hello'.match('(.)\1')[0])
    assert_equal("ll", 'hello'.match(/(.)\1/)[0])
    assert_equal(nil, 'hello'.match('xx'))
  end

  def test_succ_and_next
    assert_equal("abce", "abcd".succ)
    assert_equal("abce", "abcd".next)
    assert_equal("THX1139", "THX1138".succ)
    assert_equal("<<koalb>>", "<<koala>>".next)
    assert_equal("2000aaa", "1999zzz".succ)
    assert_equal("AAAA0000", "ZZZ9999".next)
    assert_equal("**+", "***".succ)
  end

  def test_partition
    # searches from the beginning of the string
    assert_equal(["he", "l", "lo"], "hello".partition("l"))
    assert_equal(["hello", "", ""], "hello".partition("x"))
  end

  def test_replace
    s = "Hello"
    assert_equal("World!", s.replace("World!"))
  end

  def test_reverse
    assert_equal("desserts", "stressed".reverse)
  end

  def test_rindex
    assert_equal(1, "hello".rindex("e"))
    assert_equal(3, "hello".rindex("l"))
    assert_equal(nil, "hello".rindex("a"))
    assert_equal(1, "hello".rindex(/[aeiou]/, 2))
    assert_equal(2, "hello".rindex("l", 2))
  end

  def test_rjust
    assert_equal("hello", "hello".rjust(4))
    assert_equal("               hello", "hello".rjust(20))
    assert_equal("123412341234123hello", "hello".rjust(20, "1234"))
  end

  def test_rpartition
    # searches from the end of the string
    assert_equal(["hel", "l", "o"], "hello".rpartition("l"))
    assert_equal(["", "", "hello"], "hello".rpartition("x"))
  end

  def test_rstrip
    # removes trailing whitespace
    assert_equal("hello", "hello    ".rstrip)
    assert_equal("    hello", "    hello    ".rstrip)
    assert_equal("hello", "hello".rstrip)
  end

  def test_scan
    a = "cruel world"
    assert_equal(["cruel", "world"], a.scan(/\w+/))
    assert_equal(["cru", "el ", "wor"], a.scan(/.../))
    assert_equal([["cru"], ["el "], ["wor"]], a.scan(/(...)/))
    assert_equal([["cr", "ue"], ["l ", "wo"]], a.scan(/(..)(..)/))
    assert_equal(["cru"], a.scan("cru"))
  end

  def test_slice
    str = "Bilbo Baggins"
    assert_equal("b", str.slice("b"))
    # Character codes no longer used in Ruby 1.9
    # assert_equal(105, str.slice(1))
    assert_equal("i", str.slice(1))
  end

  def test_split
    assert_equal(["now's", "the", "time"], " now's  the time".split)
    assert_equal(["now's", "the", "time"], " now's  the time".split(' '))
    assert_equal(["", "now's", "", "the", "time"], " now's  the time".split(/ /))
    assert_equal(["1", "2.34", "56", "7"], "1, 2.34,56, 7".split(%r{,\s*}))
    assert_equal(["h", "e", "l", "l", "o"], "hello".split(//))
    assert_equal(["h", "e", "llo"], "hello".split(//, 3))
    assert_equal(["h", "i", "m", "o", "m"], "hi mom".split(%r{\s*}))
    assert_equal(["m", "w y", "w"], "mellow yellow".split("ello"))
    assert_equal(["1", "2", "", "3", "4"], "1,2,,3,4,,".split(',')) # trailing fields are suppressed
    assert_equal(["1", "2", "", "3,4,,"], "1,2,,3,4,,".split(',', 4)) # creates up to 4 strings
    assert_equal(["1", "2", "", "3", "4", "", ""], "1,2,,3,4,,".split(',', -4)) # creates no limit to the number of fields returned
  end

  def test_expression_substitution
    assert_equal("Hello! Hello! Hello! ", "#{'Hello! ' * 3}")
  end

  def test_string_comparison
    #str == other_str
    assert_equal(true, "abcdef" == "abcdef") #str is equal to other_str
    assert_equal(false, "abcdefg" == "abcdef") #str is not equal to other_str

    #str <=> other_str (The spaceship (<=>) method can be used to compare two strings in relation to their alphabetical ranking.)
    assert_equal(1, "abcdef" <=> "abcde") #str is greater than other_str
    assert_equal(0, "abcdef" <=> "abcdef") #str is equal to other_str
    assert_equal(-1, "abcdef" <=> "abcdefg") #str is less than other_str
    assert_equal(1, "abcdef" <=> "ABCDEF") #str is greater than other_str

    #regex comparison to find location of object
    assert_equal(7, "Bilbo Baggins" =~ /a/)
    assert_equal(nil, "Bilbo Baggins" =~ /9/)
    assert_equal(nil, "Bilbo Baggins" =~ 9)
  end

  def test_element_reference
    a = "Bilbo Baggins"
    # Character codes no longer used in Ruby 1.9
    # assert_equal(105, a[1]) #returns the code of the character selected
    assert_equal("i", a[1]) #returns the character
    assert_equal("ilbo", a[1, 4]) #returns the characters from the offset of the first and length of the second
    assert_equal("Bilbo", a[0..4]) #returns the characters from the offset given by the range
    assert_equal("Ba", a[/[A-G][a-g]/]) #returns the matching portion of the string
    assert_equal(nil, a[/[A-G][a-g]/, 2]) #returns the Matchdata
    assert_equal("Bagg", a["Bagg"]) #returns the string if it exists
  end

  def test_element_assignment
    # Same rules as Element Reference above, except the string is being modified
    a = "Bilbo Baggins"
    assert_equal("S", a[12]="S") # the selected character is changed
    assert_equal("Bilbo BagginS", a) # the result of the change
    assert_equal("Frodo", a[0, 5]="Frodo") # the selected characters are changed
    assert_equal("Frodo BagginS", a) # the result of the change
    assert_equal("the Brave!", a[/BagginS/]="the Brave!") # the regex selected characters are changed
    assert_equal("Frodo the Brave!", a) # the result of the change
  end

  def test_interpolate_variables
    a = "Bilbo"
    assert_equal("Bilbo Baggins", "#{a} Baggins")
  end

  def test_gsub
    assert_equal("H*llo Worl*!", "Hello World!".gsub(/[a-e]/, "*"))
  end

  def test_squeeze
    assert_equal("Helo World!", "Hello World!".squeeze)
    assert_equal("yelow mon", "yellow moon".squeeze)
    assert_equal(" now is the", "   now     is       the".squeeze(" "))
    assert_equal("puters shot balls", "putters shoot balls".squeeze("m-z"))
  end

  def test_start_with
    assert_equal(true, "Bilbo Baggins".start_with?("B"))
    assert_equal(true, "Bilbo Baggins".start_with?("Bil"))
    assert_equal(false, "Bilbo Baggins".start_with?("Z"))
  end

  def test_strip
    assert_equal("hello", "     hello     ".strip)
    assert_equal("hello", "     hello".strip)
    assert_equal("hello", "hello     ".strip)
    assert_equal("goodbye", "\tgoodbye\r\n".strip)
  end

  def test_sub
    assert_equal("h*llo", "hello".sub("e", "*"))
  end

  def test_swapcase
    assert_equal("hELLO", "Hello".swapcase)
    assert_equal("GrAvITy GuN", "gRaVitY gUn".swapcase)
  end

  def test_to_i
    assert_equal(12345, "12345".to_i)
    assert_equal(0, "Hello".to_i)
    assert_equal(1, "1a".to_i)
    assert_equal(99, "99 red balloons".to_i)
    assert_equal(10, "0a".to_i(16))
  end

  def test_tr
    assert_equal("h*ll*", "hello".tr('aeiou', "*"))
    assert_equal("*e**o", "hello".tr('^aeiou', "*"))
    assert_equal("hippo", "hello".tr('el', 'ip'))
  end

  def test_tr_s
    assert_equal("*e*o", "hello".tr_s('^aeiou', "*"))
    assert_equal("hipo", "hello".tr_s('el', 'ip'))
  end

  def test_unpack
    assert_equal(["abc", "abc "], "abc \0\0abc \0\0".unpack('A6Z6'))
  end

  def test_upcase
    assert_equal("HELLO, WORLD!", "hello, world!".upcase)
  end

end

class ArrayTest < Test::Unit::TestCase

  def test_args_and_new
    assert_equal([1, 'a', /^A/], Array.[](1, 'a', /^A/))
    assert_equal(["A", "A", "A", "A", "A"], Array.new(5, "A"))
  end

  def test_array_and_other_array
    # Set Intersection—Returns a new array containing elements common to the two arrays, with no duplicates.
    assert_equal([1, 3], [1,2,3,4] & [1,3,5,8])
  end

  def test_array_times_int
    assert_equal([1,2,3,1,2,3,1,2,3], [1,2,3] * 3)
  end

  def test_array_times_str
    assert_equal("1,2,3", [1,2,3] * ",")
  end

  def test_array_plus_array
    assert_equal([1,2,3,4,5], [1,2,3] + [4,5])
  end

  def test_array_minus_array
    assert_equal([3,3,4], [1,1,2,2,3,3,4,5] - [1,2,5])
  end

  def test_array_append
    assert_equal(["Bilbo", "Baggins"], ["Bilbo"] << "Baggins")
  end

  def test_array_spaceship_comparison
    assert_equal(-1, ["a", "a", "b"] <=> ["a", "b", "c"])
    assert_equal(0,  ["a", "a", "b"] <=> ["a", "a", "b"])
    assert_equal(1,  ["a", "b", "d"] <=> ["a", "b", "c"])
  end

  def test_equal_comparison
    assert_equal(true,  ["a", "a", "b"] == ["a", "a", "b"])
    assert_equal(false, ["a", "a", "b"] == ["a", "b", "c"])
  end

  def test_array_elemental_reference
    a = ["a", "b", "c", "d", "e"]
    assert_equal("bad", a[1] + a[0] + a[3])
    assert_equal(nil, a[6])
    assert_equal(["b", "c"], a[1, 2])
    assert_equal(["b", "c", "d"], a[1..3])
    assert_equal(["e"], a[4..7])
    assert_equal(nil, a[6..10])
    assert_equal(["c", "d", "e"], a[-3, 3])
    # special cases
    assert_equal(nil, a[5])
    assert_equal([],  a[5, 1])
    assert_equal([],  a[5..10])
  end

  def test_array_assignment
    # Parallel assingment
    first_name, last_name = ["John", "Smith"]
    assert_equal("John", first_name)
    assert_equal("Smith", last_name)

    # Parallel assignment with extra values
    first_name, last_name = ["John", "Smith", "III"]
    assert_equal("John", first_name)
    assert_equal("Smith", last_name)

    # Parallel assignment with splat operator
    first_name, *last_name = ["John", "Smith", "III"]
    assert_equal("John", first_name)
    assert_equal(["Smith", "III"], last_name)

    # Parallel assignment with too few variables
    first_name, last_name = ["Cher"]
    assert_equal("Cher", first_name)
    assert_equal(nil, last_name)

    # Parallel assignment with sub-arrays
    first_name, last_name = [["Willie", "Rae"], "Johnson"]
    assert_equal(["Willie", "Rae"], first_name)
    assert_equal("Johnson", last_name)

    # Parallel assignment with one variable
    first_name, = ["John", "Smith"]
    assert_equal "John", first_name

  end

  def test_array_elemental_assignment
    a = Array.new

    a[4] = "4"
    assert_equal([nil, nil, nil, nil, "4"], a)

    a[0, 3] = ["a", "b", "c"]
    assert_equal(["a", "b", "c", nil, "4"], a)

    a[1..2] = [1, 2]
    assert_equal(["a", 1, 2, nil, "4"], a)

    a[0, 2] = "?"
    assert_equal(["?", 2, nil, "4"], a)

    a[0..2] = "A"
    assert_equal(["A", "4"], a)

    a[-1] = "Z"
    assert_equal(["A", "Z"], a)

    a[1..-1] = nil
    assert_equal(["A",nil], a)
  end

  def test_array_assoc
    # Searches through an array whose elements are also arrays comparing obj with 
    # the first element of each contained array using obj.==. Returns the first 
    # contained array that matches (that is, the first associated array), or nil if 
    # no match is found

    s1 = [ "colors", "red", "blue", "green" ]
    s2 = [ "letters", "a", "b", "c" ]
    s3 = "foo"
    a  = [ s1, s2, s3 ]
    assert_equal([ "letters", "a", "b", "c" ], a.assoc("letters"))
    assert_equal(nil, a.assoc("foo"))
  end

  def test_array_at
    a = [ "a", "b", "c", "d", "e" ]
    #  See also Array#[]. (Array#at is slightly faster than Array#[], 
    # as it does not accept ranges and so on.)
    
    assert_equal("b", a.at(1))
    assert_equal("d", a.at(-2))

    # Choose a random element from an array.
    a.sample
  end

  def test_array_clear
    a = ["a", "b", "c"]
    assert_equal([], a.clear)
  end

  def test_array_collect_map
    a = ["a", "b", "c"]
    assert_equal(["a!", "b!", "c!"], a.collect { |x| x + "!" })
    assert_equal(["a!", "b!", "c!"], a.map { |x| x + "!" })
  end

  def test_array_compact
    a = ["a", nil, nil, "b", nil, "c"]
    assert_equal(["a", "b", "c"], a.compact)
  end

  def test_array_concat
    assert_equal(["a", "b", "c", "d"], ["a", "b"].concat(["c", "d"]))
  end

  def test_array_count
    a = [1,2,4,2]
    assert_equal(4, a.count)
    assert_equal(2, a.count(2))
    assert_equal(3, a.count { |x| x%2==0 })
  end

  def test_array_cycle
    # returns forever if none or nil is given after cycle
    a = ["a", "b", "c"]
    assert_equal(nil, a.cycle(2) {|x| x })
  end

  def test_array_delete
    a = ["a", "b", "b", "b", "c"]
    assert_equal("b", a.delete("b"))
    assert_equal(["a", "c"], a)
    assert_equal(nil, a.delete("z"))
    assert_equal("not found", a.delete("z") { "not found" })
  end

  def test_array_delete_at
    # Deletes the element at the specified index, returning that element, 
    # or nil if the index is out of range. 
    a = %w( ant bat cat dog )
    assert_equal("cat", a.delete_at(2))
    assert_equal(nil, a.delete_at(99))
  end

  def test_array_delete_if
    # Deletes every element of self for which block evaluates to true.
    a = ["a", "b", "c"]
    assert_equal(["a"], a.delete_if {|x| x >= "b" })
  end

  def test_array_drop
    # Drops first n elements from ary, and returns rest elements in an array.
    a = [1, 2, 3, 4, 5, 0]
    assert_equal([4, 5, 0], a.drop(3))
  end

  def test_array_drop_while
    # Drops elements up to, but not including, the first element for which the 
    # block returns nil or false and returns an array containing the remaining elements.
    a = [1, 2, 3, 4, 5, 0]
    assert_equal([3, 4, 5, 0], a.drop_while {|i| i < 3})
  end

  def test_array_each
    # Calls block once for each element in self, passing that element as a parameter.
    a = %w(a b c)
    assert_equal(["a", "b", "c"], a.each {|x| x })
  end

  def test_array_each_index
    # Same as Array#each, but passes the index of the element instead of the element itself.
    a = %w(a b c)    
    assert_equal(["a", "b", "c"], a.each_index {|x| x})
  end

  def test_array_empty
    assert_equal(true, [].empty?)
  end

  def test_array_eql
    a = %w(a b c)
    b = ["a", "b", "c"]
    assert_equal(true, a.eql?(b))
  end

  def test_array_fetch
    a = [11, 22, 33, 44]
    assert_equal(22, a.fetch(1))
    assert_equal(44, a.fetch(-1))
    assert_equal("cat", a.fetch(4, "cat"))
    assert_equal(16, a.fetch(4) {|i| i*i })
  end

  def test_array_fill
    # The last two forms fill the array with the value of the block. 
    # The block is passed the absolute index of each element to be filled.
    a = %w(a b c d)
    assert_equal(["x", "x", "x", "x"], a.fill("x"))
    assert_equal(["x", "x", "z", "z"], a.fill("z", 2, 2))
    assert_equal(["y", "y", "z", "z"], a.fill("y", 0..1))
    assert_equal([0, 1, 4, 9], a.fill { |i| i*i })
    assert_equal([0, 1, 8, 27], a.fill(-2) {|i| i*i*i })
  end

  def test_array_index
    # can also use find_index
    a = %w(a b b c b)
    assert_equal(3, a.index("c"))
    assert_equal(nil, a.index("x"))
    assert_equal(1, a.index{|x| x=="b"})
    assert_equal(1, a.find_index{|x| x=="b"})
  end

  def test_array_first
    a = %w(a b c d)
    assert_equal("a", a.first)
    assert_equal(["a"], a.first(1))
    assert_equal(["a", "b", "c"], a.first(3))
    a = []
    assert_equal(nil, a.first)
    assert_equal([], a.first(2))
  end

  def test_array_flatten
    s = [1, 2, 3]
    t = [4, 5, 6, [7, 8]]
    a = [s, t, 9, 10]
    assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], a.flatten)
    a = [1, 2, [3, [4, 5]]]
    assert_equal([1, 2, 3, [4, 5]], a.flatten(1))
  end

  def test_array_frozen
    a = %w(a b c)
    assert_equal(false, a.frozen?)
  end

  # the hash value is never the same so there is no way to test properly
  def test_array_hash
  #   a = %w(brendan baird billy)
  #   assert_equal(1047868961, a.hash)
  end

  def test_array_include
    a = %w(a b c)
    assert_equal(true, a.include?("c"))
    assert_equal(false, a.include?("x"))
  end

  def test_array_replace
    a = %w(a b c d e)
    assert_equal(["x", "y", "z"], a.replace(%w(x y z)))
  end

  def test_array_inject
    # inject can be used to sum up or multiply all elements in an array
    a = [1,3,5,7]
    assert_equal(16, a.inject(0){|sum,element| sum + element })
    assert_equal(16, a.inject(:+)) # short hand, does the same as above
    assert_equal(105, a.inject(1){|product,element| product * element })
    assert_equal(105, a.inject(:*)) # short hand, does the same as above
  end

  def test_array_insert
    a = %w(a b c d)
    assert_equal(["a", "b", 99, "c", "d"], a.insert(2, 99))
    assert_equal(["a", "b", 99, "c", 1, 2, 3, "d"], a.insert(-2, 1, 2, 3))
  end

  def test_array_inpect
    a = %w(a b c d)
    assert_equal("[\"a\", \"b\", \"c\", \"d\"]", a.inspect)
  end

  def test_array_join
    assert_equal("abc", ["a", "b", "c"].join)
    assert_equal("a-b-c", ["a", "b", "c"].join("-"))
  end

  def test_array_last
    a = %w(w x y z)
    assert_equal("z", a.last)
  end

  def test_array_length
    a = [1, 2, 3, 4, 5]
    assert_equal(5, a.length)
  end

  def test_array_permutation
    a = [1, 2, 3]
    assert_equal([[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]], a.permutation.to_a)
    assert_equal([[1], [2], [3]], a.permutation(1).to_a)
    assert_equal([[1,2], [1,3], [2,1], [2,3], [3,1], [3,2]], a.permutation(2).to_a)
    assert_equal([[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]], a.permutation(3).to_a)
    assert_equal([], a.permutation(4).to_a)
    assert_equal([[]], a.permutation(0).to_a)
  end

  def test_array_pop
    a = %w(a b c d e f)
    assert_equal("f", a.pop)
    assert_equal(["c", "d", "e"], a.pop(3))
  end

  def test_array_push
    a = %w(a b c)
    assert_equal(["a", "b", "c", "d", "e", "f"], a.push("d", "e", "f"))
  end

  def test_array_reverse
    a = %w(a b c)
    assert_equal(["c", "b", "a"], a.reverse)
  end

  def test_array_shift
    a = %w(a b c d)
    assert_equal("a", a.shift)
    assert_equal(["b", "c"],a.shift(2))
  end

  def test_array_shuffle
    a = [1, 1, 1]
    assert_equal([1, 1, 1], a.shuffle)
  end

end

class HashTest < Test::Unit::TestCase

  def test_hash_create
    assert_equal({"a" => 100, "b" => 200}, Hash["a", 100, "b", 200])
    assert_equal({"a" => 100, "b" => 200}, Hash["a" => 100, "b" => 200])
    assert_equal({"a" => 100, "b" => 200}, {"a" => 100, "b" => 200})
  end

  def test_hash_new_hash
    h = Hash.new("Go Fish")
    h["a"] = 100
    h["b"] = 200
    assert_equal(100, h["a"])
    assert_equal("Go Fish", h["c"])
    assert_equal("GO FISH", h["c"].upcase!)
    assert_equal("GO FISH", h["d"])
    assert_equal(["a", "b"], h.keys)
    h = Hash.new {|hash, key| hash[key] = "Go Fish: #{key}"}
    assert_equal("Go Fish: c", h["c"])
    assert_equal("GO FISH: C", h["c"].upcase!)
    assert_equal("Go Fish: d", h["d"])
    assert_equal(["c", "d"], h.keys)
  end

  def test_hash_equality
    h1 = {"a" => 1, "c" => 2}
    h2 = {7 => 35, "c" => 2, "a" => 1}
    h3 = {"a" => 1, "c" => 2, 7 => 35}
    h4 = {"a" => 1, "d" => 2, "f" => 35}
    assert_equal(false, h1==h2)
    assert_equal(true, h2==h3)
    assert_equal(false, h3==h4)
  end

  def test_hash_elemental_ref
    h = {"a" => 100, "b" => 200}
    assert_equal(100, h["a"])
    assert_equal(nil, h["c"])
  end

  def test_hash_elemental_assignment
    h = {"a" => 100, "b" => 200}
    assert_equal(9, h["a"] = 9)
    assert_equal(4, h["c"] = 4)
    assert_equal({"a" => 9, "b" => 200, "c" => 4}, h)
  end

  def test_hash_clear
    h = {"a" => 100, "b" => 200}
    assert_equal({}, h.clear)
  end

  def test_hash_default
    h = Hash.new
    assert_equal(nil, h.default)
    assert_equal(nil, h.default(2))
    h = Hash.new("cat")
    assert_equal("cat", h.default)
    assert_equal("cat", h.default(2))
    h = Hash.new{|hash, key| hash[key] = key.to_i*10}
    assert_equal(nil, h.default)
    assert_equal(20, h.default(2))
    h = {"a" => 100, "b" => 200}
    h.default = "Go Fish"
    assert_equal(100, h["a"])
    assert_equal("Go Fish", h["z"])
  end

  def test_hash_delete
    h = {"a" => 100, "b" => 200}
    assert_equal(100, h.delete("a"))
    assert_equal(nil, h.delete("z"))
    assert_equal("z not found", h.delete("z") {|el| "#{el} not found"})
  end

  def test_hash_delete_if
    h = {"a" => 100, "b" => 200}
    assert_equal({"a" => 100}, h.delete_if {|k,v| k >= "b"})
  end

  def test_hash_each
    h = {"a" => 100, "b" => 200}
    assert_equal({"a" => 100, "b" => 200}, h.each {|k,v| "#{k} is #{v}"})
  end

  def test_hash_each_key
    h = {"a" => 100, "b" => 200}
    assert_equal({"a" => 100, "b" => 200}, h.each_key {|k| k})
  end

  def test_hash_each_pair
    h = {"a" => 100, "b" => 200}
    assert_equal({"a" => 100, "b" => 200}, h.each_pair {|k,v| "#{k} is #{v}"})
  end

  def test_hash_each_value
    h = {"a" => 100, "b" => 200}
    assert_equal({"a" => 100, "b" => 200}, h.each_value {|v| v})
  end

  def test_hash_empty
    h = {"a" => 100, "b" => 200}
    assert_equal(false, h.empty?)
  end

  def test_hash_eql
    h1 = {"a" => 1, "c" => 2}
    h2 = {7 => 35, "c" => 2, "a" => 1}
    h3 = {"a" => 1, "c" => 2, 7 => 35}
    h4 = {"a" => 1, "d" => 2, "f" => 35}
    assert_equal(false, h1.eql?(h2))
    assert_equal(true, h2.eql?(h3))
    assert_equal(false, h3.eql?(h4))
  end

  def test_hash_fetch
    h = {"a" => 1, "c" => 2}
    assert_equal(1, h.fetch("a"))
    assert_equal("go fish", h.fetch("z", "go fish"))
    assert_equal("go fish, z", h.fetch("z") {|el| "go fish, #{el}"})
    assert_raise(KeyError) do
      h.fetch("z")
    end
  end

  def test_hash_has_key
    # can use has_key?, include?, key? or member?
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal(true, h.has_key?("a"))
    assert_equal(true, h.include?("a"))
    assert_equal(true, h.key?("a"))
    assert_equal(true, h.member?("a"))
    assert_equal(false, h.has_key?("z"))
  end

  def test_hash_has_value
    # has_value? or value? both work
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal(true, h.has_value?(10))
    assert_equal(true, h.value?(10))
  end

  def test_hash_key
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal("a", h.key(10))
    assert_equal(nil, h.key(99))
  end

  def test_hash_replace
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal({"c" => 40, "d" => 50}, h.replace({"c" => 40, "d" => 50}))
  end

  def test_hash_inspect
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal("{\"a\"=>10, \"b\"=>20, \"c\"=>30}", h.inspect)
  end

  def test_hash_invert
    h = {"a" => 10, "b" => 20}
    assert_equal({10 => "a", 20 => "b"}, h.invert)
  end

  def test_hash_keys
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal(["a", "b", "c"], h.keys)
  end

  def test_hash_length_or_size
    h = {"a" => 10, "b" => 20, "c" => 30}
    assert_equal(3, h.length)
    assert_equal(3, h.size)
  end

  def test_hash_merge
    h1 = {"a" => 10, "b" => 20}
    h2 = {"c" => 30, "d" => 40}
    assert_equal({"a" => 10, "b" => 20, "c" => 30, "d" => 40}, h1.merge(h2))
    h1 = {"a" => 10, "b" => 20}
    h2 = {"b" => 30, "d" => 40}
    assert_equal({"a" => 10, "b" => 20, "d" => 40}, h1.merge!(h2) {|key, v1, v2| v1})
    # can also use update
    h1 = {"a" => 10, "b" => 20}
    h2 = {"b" => 30, "d" => 40}
    assert_equal({"a" => 10, "b" => 20, "d" => 40}, h1.update(h2) {|key, v1, v2| v1})
  end

  def test_hash_rehash
    a = ["a", "b"]
    c = ["c", "d"]
    h = {a => 100, c => 300}
    assert_equal(100, h[a])
    a[0] = "z"
    assert_equal(nil, h[a])
    assert_equal({["z", "b"]=>100, ["c", "d"]=>300}, h.rehash)
    assert_equal(100, h[a])
  end

  def test_hash_select
    h = {"a" => 100, "c" => 300}
    # Starting in ruby 1.9, no longer returns an array
    # assert_equal([["c", 300]], h.select {|k,v| k > "a" })
    # assert_equal([["a", 100]], h.select {|k,v| v < 200 })
    assert_equal({"c"=>300}, h.select {|k,v| k > "a"})
    assert_equal({"a"=>100}, h.select {|k,v| v < 200})
  end

  def test_hash_shift
    h = {"a" => 100, "c" => 300}
    assert_equal(["a", 100], h.shift)
  end

  def test_hash_sort
    h = {"z" => 1000, "a" => 100, "c" => 300}
    assert_equal([["a", 100], ["c", 300], ["z", 1000]], h.sort)
  end

  def test_hash_to_a
    h = {"a" => 100, "c" => 300}
    assert_equal([["a", 100], ["c", 300]], h.to_a)
  end

  def test_hash_to_hash
    h = {"a" => 100, "c" => 300}
    assert_equal({"a" => 100, "c" => 300}, h.to_hash)
  end

  def test_hash_to_s
    h = {"a" => 100, "c" => 300}
    # Ruby 1.9 no longer returns a string, now returns the contents as string
    # assert_equal("a100c300", h.to_s)
    assert_equal("{\"a\"=>100, \"c\"=>300}",h.to_s)
  end

  def test_hash_values
    h = {"a" => 100, "c" => 300}
    assert_equal([100, 300], h.values)
  end

  def test_hash_values_at
    h = {"a" => 100, "c" => 300}
    assert_equal([100], h.values_at("a"))
  end

end

class NilTest < Test::Unit::TestCase

  def test_nil_object
    assert_equal(true, nil.nil?)
  end

  def test_nil_string
    assert_equal("", nil.to_s)
  end

end

class AssertTest < Test::Unit::TestCase

  def test_assert_truth
    assert true
  end

end

class RegexTest < Test::Unit::TestCase
  
  def test_replace_apostrophe
    a = '"Johnny"'
    assert_equal('Johnny', a.gsub(/["]/,""))
  end
  
end

class EnumeratorTest < Test::Unit::TestCase

  def test_to_enum
    a = [1,3,"cat"]
    h = { dog: "canine", fox: "vulpine"}
    enum_a = a.to_enum
    enum_h = h.to_enum
    
    assert_equal(1, enum_a.next)
    assert_equal([:dog, "canine"], enum_h.next)
    assert_equal(3, enum_a.next)
    assert_equal([:fox, "vulpine"], enum_h.next)
  end

end

class MethodTest < Test::Unit::TestCase
  
  def test_splat
    # splat is when you place a * in before an argument in a method, indicating there may be more than one arguement
    # def method(arg,*args)
    #   args.each{|a| "#{arg} + #{a}"}
    # end
    
  end

end