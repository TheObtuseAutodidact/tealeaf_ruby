
# building the deck as an array of arrays

val_arr = %w(2 3 4 5 6 7 8 9 10 j q k a)
suit_arr1 = %w(h h h h h h h h h h h h h)
suit_arr2 = %w(s s s s s s s s s s s s s)
suit_arr3 = %w(c c c c c c c c c c c c c)
suit_arr4 = %w(d d d d d d d d d d d d d)

hearts = suit_arr1.zip(val_arr)
spades = suit_arr2.zip(val_arr)
clubs = suit_arr3.zip(val_arr)
diamonds = suit_arr4.zip(val_arr)

suits = [hearts, spades, clubs, diamonds]

full_deck = []
suits.each do |suit|
  suit.each { |card| full_deck << card }
end

full_deck.shuffle!

player_hand = []
computer_hand = []

def deal_card(hand, deck)
  hand << deck.shift
end

def open_game(player1, player2, deck)
  deal_card(player1, deck)
  deal_card(player1, deck)
  deal_card(player2, deck)
  deal_card(player2, deck)
end

def hit(hand, deck)
  new_card = deck.shift
  hand << new_card
end

# *************************
def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end
# **************************

def busted?(hand)
  return true if total(hand) > 21
end

#   ******* Game Loop ******

# open_game(player_hand, computer_hand, full_deck)

loop do
  open_game(player_hand, computer_hand, full_deck)
  puts "Players hand: #{player_hand}"
  puts "Computer shows #{computer_hand[1]}"
  loop do
    puts "Player turn: "
    puts "Hit or Stay?('h' or 's'): "
    turn = gets.chomp.downcase[0]

    case turn
    when 'h'
      hit(player_hand, full_deck)
      puts "Players hand: #{player_hand} for a score of #{total(player_hand)}"
      break if busted?(player_hand)
    when 's'
      puts "player stayed"
      break
    else
      puts "Not a valid input. Try again."
    end
  end

  if busted?(player_hand)
    puts "Player Busted!"
  else
    puts "Computer turn"
    loop do
      if total(computer_hand) < 17
        hit(computer_hand, full_deck)
      elsif  total(computer_hand) >= 17 && total(computer_hand) <= 21
        puts "Computer calls"
        break
      else
        puts "Computer Busted! Player Winds!"
        break
      end
    end
  end

  if total(player_hand) > total(computer_hand) && !busted?(player_hand)
    puts "Players hand: #{player_hand} for a score of #{total(player_hand)}"
    puts "Computer hand: #{computer_hand} for a score of #{total(computer_hand)}"
    puts "Player Wins!"
  elsif total(computer_hand) > total(player_hand) && !busted?(computer_hand)
    puts "Players hand: #{player_hand} for a score of #{total(player_hand)}"
    puts "Computer hand: #{computer_hand} for a score of #{total(computer_hand)}"
    puts "Computer Wins!"
  else
    if !busted?(player_hand) && !busted?(computer_hand)
      puts "Players hand: #{player_hand} for a score of #{total(player_hand)}"
      puts "Computer hand: #{computer_hand} for a score of #{total(computer_hand)}"
      puts "It's a tie!"
    end
  end
  puts "Would you like to play another hand?('no' or 'n' to exit)"
  again = gets.chomp.downcase[0]
  if again == 'n'
    puts "Thanks for playing!"
    break
  else
    player_hand = []
    computer_hand = []
  end
end
