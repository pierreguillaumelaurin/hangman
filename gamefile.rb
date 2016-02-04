require './hangman.rb'
class Gamefile
  def initialize
  end

  def save_game(filename)
    yaml = YAML::dump()
    saved_file = Hangman.new('yoli','5desk.txt')
    game_file.write(yaml)
  end

  def load_game
    load_file #= 'a'
  end
end