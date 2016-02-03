require './player.rb'

class Hangman
  attr_accessor :player

  def initalize(name)
    @player = Player.new(name)
  end
  
  def select_word(script)
  	word = File.readlines(script).sample
  	return word
  end  

  def new_turn
  	
  end

  def update
  end
end


