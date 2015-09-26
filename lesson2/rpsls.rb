VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors', 'l' => 'lizard', 'sp' => 'spock' }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie! No points awarded.")
  end
end

loop do
  choice = ''
  sanitized_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES}")
    choice = gets.chomp
    if VALID_CHOICES.key?(choice)
      sanitized_choice = VALID_CHOICES[choice]
      break
    elsif VALID_CHOICES.value?(choice)
      sanitized_choice = choice
      break
    else
      prompt("That's not a valid choice. Choose one by key.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{sanitized_choice}; Computer chose: #{computer_choice}")

  display_results(sanitized_choice, computer_choice)

  prompt("Do you want to play again?( 'y' to continue)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
