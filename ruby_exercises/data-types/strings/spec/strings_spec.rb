RSpec.describe 'Strings' do
  it 'test 1' do
    name = "alice"
    # In place of the line below, call a method on the name variable
    # defined above to acheive the expected output.
    actual = name.capitalize
    # `.capitalize` -> returns copy of string w/1st character uppercase and remaining characters lowercase
    expected = "Alice"

    expect(actual).to eq(expected)
  end

  it 'test 2' do
    name = "aLiCe"
    # In place of the line below, call a method to achieve the expected output.
    actual = name.upcase
    # `.upcase` -> returns copy of string w/all lowercase letters replaced by uppercase ones
    expected = "ALICE"

    expect(actual).to eq(expected)
  end

  it 'test 3' do
    name = "AlIcE"
    # In place of the line below, call a method to achieve the expected output.
    actual = name.downcase
    # `.downcase` -> returns copy of string w/all uppercase letters replaced by lowercase ones
    expected = "alice"

    expect(actual).to eq(expected)
  end

  it 'test 4' do
    rhyme = "peter piper picked a peck of picked peppers"
    # In place of the line below, call a method to achieve the expected output.
    actual = rhyme.reverse
    # `.reverse` -> returns new string w/characters in reverse order
    expected = "sreppep dekcip fo kcep a dekcip repip retep"

    expect(actual).to eq(expected)
  end

  it 'test 5' do
    word = "ticking"
    # In place of the line below, call a method to achieve the expected output.
    actual = word.sub(/t/, 'k')
    # `.sub` -> returns copy of string w/1st occurence of pattern (/t/) replaced by the 2nd argument ('k')
    expected = "kicking"

    expect(actual).to eq(expected)
  end

  it 'test 6' do
    word = "ticking"
    # In place of the line below, call a method to achieve the expected output.
    actual = word.sub(/ti/, 'clo')
    expected = "clocking"

    expect(actual).to eq(expected)
  end

  it 'test 7' do
    words = "five sleepy kittens"
    # In place of the line below, call a method to achieve the expected output.
    actual = words.gsub(/e/, '*')
     # `.gsub` -> returns copy of string w/all occurrences of a pattern (/e/) substituted for the 2nd argument ('*')
    expected = "fiv* sl**py kitt*ns"

    expect(actual).to eq(expected)
  end

  it 'test 8' do
    greeting = "Hello!!"
    # In place of the line below, call a method to achieve the expected output.
    actual = greeting.chop
    # `.chop` -> returns string w/last character removed
    expected = "Hello!"

    expect(actual).to eq(expected)
  end

  it 'test 9' do
    greeting = "Hello!!\n"
    # In place of the line below, call a method to achieve the expected output.
    actual = greeting.chomp
    # `.chomp` -> returns new string w/record separator removed from end of the string
    expected = "Hello!!"

    expect(actual).to eq(expected)
  end

  it 'test 10' do
    greeting = "Hello!!\n\n"
    # In place of the line below, call a method to achieve the expected output.
    actual = greeting.chomp
    expected = "Hello!!\n"

    expect(actual).to eq(expected)
  end

  it 'test 11' do
    rhyme = "eeny, meeny, miny, moe"
    # In place of the line below, call a method to achieve the expected output.
    actual = rhyme.delete "e"
    # `.delete` -> returns copy of string w/all characters in the intersection of its arguments deleted
    expected = "ny, mny, miny, mo"

    expect(actual).to eq(expected)
  end

  it 'test 12' do
    rhyme = "eeny, meeny, miny, moe"
    # In place of the line below, call a method to achieve the expected output.
    actual = rhyme.delete "aeiou"
    expected = "ny, mny, mny, m"

    expect(actual).to eq(expected)
  end

  it 'test 13' do
    greeting = "Hello World!"
    # In place of the line below, call a method to get the number of characters in the string
    actual = greeting.length
    # `.length` -> returns character length of the string
    expected = 12

    expect(actual).to eq(expected)
  end

  it 'test 14' do
    greeting = "Hello World!\n"
    # In place of the line below, call a method to get the number of characters in the string
    actual = greeting.length
    expected = 13

    expect(actual).to eq(expected)
  end

  it 'test 15' do
    greeting = "Hello       World!"
    # In place of the line below, call a method to get the number of characters in the string
    actual = greeting.length
    expected = 18

    expect(actual).to eq(expected)
  end

  it 'test 16' do
    greeting = "Hello World!"
    # In place of the line below, call a method to get the number of 'o' in the string
    actual = greeting.count "o"
    # `.count` -> counts number of times the characters 'o' appears in the string
    expected = 2

    expect(actual).to eq(expected)
  end

  it 'test 17' do
    greeting = "Hello World!"
    # In place of the line below, call a method to get the number of vowels in the string
    actual = greeting.count "eo"
    # note: could have used `.count "e" "o"`` instead if wanted 
    expected = 3

    expect(actual).to eq(expected)
  end

  it 'test 18' do
    greeting = "Hello World!"
    # In place of the line below, call a method to check if the string includes 'llo'
    actual = greeting.include? "llo"
    # `.include?` -> returns `true` if string contains the given string or character
    expected = true

    expect(actual).to eq(expected)
  end

  it 'test 19' do
    greeting = "Hello World!"
    # In place of the line below, call a method to check if the string includes 'lol'
    actual = greeting.include? "lol"
    expected = false

    expect(actual).to eq(expected)
  end

  it 'test 20' do
    greeting = "Hello World, my name is"
    name = "Harry Potter"
    # In place of the line below, use string manipulation to combine the
    #greeting and name variables to acheive the expected outcome
    actual = greeting.concat(" ", name)
    # `.concat` -> links given object(s) to the string
    # the `" "` is required in order to not have the return be "Hello World, my name isHarry Potter"
    expected = "Hello World, my name is Harry Potter"

    expect(actual).to eq(expected)
  end

  it 'test 21' do
    # See if you can use another method than the last test to achieve the same goal:
    greeting = "Hello World, my name is "
    name = "Harry Potter"
    actual = greeting << name
    # `<<` -> appends given object to string
    # unlike 'concat', '<<' takes a single argument
    # greeting's string had a space added to the end to separate the "Hello World.." and "Harry Potter"
    expected = "Hello World, my name is Harry Potter"

    expect(actual).to eq(expected)
  end

  it 'test 22' do
    greeting = "Hello World, my name is "
    name = "Harry Potter"
    actual = name.prepend(greeting)
    # `.prepend` -> adds given string (greeting) to the beginning of the string (name)
    expected = "Hello World, my name is Harry Potter"

    expect(actual).to eq(expected)
  end

  it 'test 23' do
    phrase = "  \n\t to the moon\n\n\t    "
    # In place of the line below, call a method to acheive the expected outcome
    actual = phrase.strip
    # `.strip` -> returns copy of string w/whitespace at start and end removed
    expected = "to the moon"

    expect(actual).to eq(expected)
  end
end
