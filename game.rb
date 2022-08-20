def acquaintance
  difficulty_list = ["easy, medium, hard"];
  puts "Hello! whats your name?"
  name = gets.chomp();
  puts "Select a difficulty level, Easy, Medium or Hard"
  difficulty = gets.chomp();

  if name === "" or !difficulty_list.include? difficulty.downcase
    error = name === "" ? "Name cannot be empty!" : "Invalid difficulty level";
    puts "[Error]: #{error}"
    acquaintance()
  end

  return { :name => name, :difficulty => difficulty }
end

# acquaintance()

def get_word
  lines = File.readlines("words.txt")
  return lines[rand(lines.length)]
end

def hash_word( word )
  return word if word.length < 3

  hashed_word = ""
  word.length.times do | index |
    char = word[index];
    hashed_word += index % 2 != 0 ? "_" : char;
  end

  return hashed_word

end

puts hash_word("magret")
