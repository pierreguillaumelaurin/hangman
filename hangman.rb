require './player.rb'

class Hangman
  attr_accessor :player

  def initialize(name, script)
    @player = Player.new(name)
    @word = select_word(script)

  end

  def new_turn
  end

  def update
  end

  private

  def select_word(script)
  	word = File.readlines(script).sample
  	return word
  end  
end


