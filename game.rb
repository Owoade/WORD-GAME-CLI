$score = 0;

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


def get_word
  lines = File.readlines("words.txt")
  return lines[rand(lines.length)].chomp()

  rescue
  return lines[rand(lines.length)].chomp()
end

def generate_word
  word = get_word();
  return word if word.length < 3
  hashed_word = "";

  word.length.times do | index |
    char = word[index];
    hashed_word += index % 2 != 0 ? "_" : char;
  end

  return { :hashed_word => hashed_word, :word => word }

end


def gameplay
  word_hash = generate_word();
  puts word_hash[:word];
  puts "Unscrable the word: #{ word_hash[:hashed_word] }";
  user_input = gets.chomp();

  if user_input === word_hash[:word]
    puts "Great! you got it right";
    $score += 1;
    puts "Score: #{ $score }"
    return gameplay()
  end

  puts "Gameover('_') you got it wrong";
  puts "Score: #{ $score }"
  return
end

gameplay()
