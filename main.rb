require './hangman.rb'
require './starter.rb'

puts "WELCOME TO MY WONDERFUL HANGMAN GAME! PRESS 'l' TO LOAD A FILE OR 'n' TO START A NEW GAME!"
usr_input = String(gets).downcase.chomp
yoli = Hangman.new('5desk.txt')
if usr_input == 'n'
  yoli.info
  yoli.save('yoli.txt')
elsif usr_input == 'l'
  puts "PLEASE ENTER THE NAME OF THE FILE YOU WOULD LIKE TO LOAD!"
  usr_file = String(gets).chomp
  yoli = yoli.load(usr_file)
  puts "yoli: #{yoli}"
end

continue = true
while continue == true
	puts "chances left: #{yoli.counter}"
	yoli.info
	usr_prompt = String(gets).downcase.chomp
	if usr_prompt == "save"
		yoli.save('yoli.txt')
		puts "game saved!"
	elsif yoli.answer?(usr_prompt) == false
		yoli.counter_substract(1)
	end

	if yoli.winner?
		yoli.win
		continue = false
	elsif yoli.counter == 0
		yoli.lose
		continue = false
	end
end

puts 'out of loop'