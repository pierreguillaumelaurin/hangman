require 'yaml'

class Hangman

  def initialize(script)
    @script = script
    @word = select_word(script).chomp
    @word_array = @word.downcase.split("")
    @answer_array = Array.new(@word.length){'_'}
    @counter = 5
  end

  def info
    """only use during developement to see game status"""
  	puts "word: #{@word}"
  	puts "array: #{@word_array}"
  	puts "user_array: #{@answer_array}"
  end

  def counter
    return @counter
  end

  def counter_substract(number)
    @counter -= number
  end

  def answer?(input)
  	if check_input(input) == true
  	  check_answer(input)
  	end
  end

  def winner?
  	if @word_array == @answer_array
      return true
    end
  end

  def win
  	puts "YEAH! YOU WON! WAY TO GO!!!"
  end

  def lose
  	puts  "NOOOOOO! YOU DIDN'T FOUND THE WORD!!!! IT WAS #{@word.upcase}."
  end

  def save(filename)
    File.open(filename,'w') {|f| f.puts self.to_yaml}
    puts "Game saved to #{filename}!"
  end

  def load(filename)
    content = File.open(filename,'r') #{|file| file.read}
    return YAML.load(content)
    puts "#{filename} SHOULD BE HERE IN A SEC!"
  end

  private 

  def check_input(input)
  	if input == "^s"
      return "save"
    elsif input.length > 1
  		puts "NO YOUR INPUT IS TOO LONG!"
  	elsif input == /[a-z]/
  		puts "NOOOOO YOU MUST USE A LETTER!!!"
  	else
  		return true
  	end
  end

  def select_word(script)
      word = File.readlines(script).sample
      return word
    end

  def check_answer(input)
    if @word_array.include?(input)
  		letter_indexes = @word_array.each_index.select{|i| @word_array[i] == input}
  		letter_indexes.each do |index|
  		  @answer_array[index] = input
  		end
  		return true
  	  else
  		return false
  	end
  end

end


