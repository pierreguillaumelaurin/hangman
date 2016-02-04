class Starter
	def initialize(script)
	  @script = script
	  @word = select_word(script).chomp
      @word_array = @word.downcase.split("")
      @answer_array = Array.new(@word.length){'_'}
	end

	def word
	  return @word
	end

	def word_array
	  return @word_array
	end
	
	def answer_array
	  return @answer_array
	end

	def prompt_choice
	end


	private

	def select_word(script)
  	  word = File.readlines(script).sample
  	  return word
  	end
end