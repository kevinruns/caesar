require 'pry'

$letterToNum = {}
$numToLetter = {}
i = 0
alphabet_array = [*'a'..'z']

alphabet_array.each do |lclet|
  $letterToNum[lclet] = i
  $numToLetter[i] = lclet
  i = i + 1
end

def runCaesar(string, move)
  stringArr = string.split("")
  newStringArr = []

  stringArr.each do |letter|
    uc = false	
    newLetter = ""  
    if letter.match(/[^A-Za-z]/)
      newStringArr.push(letter)

    else
      if letter =~ /[A-Z]/ 
    	  uc = true
    	  letter = letter.downcase
      end

      num = $letterToNum[letter]
      codeNum = (num + move) % 26
      newLetter = $numToLetter[codeNum]

      if uc then
        newLetter= newLetter.upcase
      end

      newStringArr.push(newLetter)

    end  
  end

  outStr = newStringArr.join("")
  puts outStr

end

puts "Please enter a string:"
string  = gets.chomp
runCaesar(string,5)

exit
