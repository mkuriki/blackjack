require_relative 'deck'
require_relative 'hand'

class Blackjack
  attr_reader :deck, :player, :computer

  def initialize
    @deck = Deck.new
    @player = Hand.new(deck, 'player')
    @computer = Hand.new(deck, 'computer')
  end

  def show_hand(whose_hand, answer = nil)
    who = whose_hand.name.downcase.capitalize
    str = ""
    if answer != :stand
      if whose_hand.cards.count == 2
        whose_hand.cards.each { |card| str += "#{who} was dealt #{card}\n" }
      else
        str += "#{who} was dealt #{whose_hand.cards[-1]}\n"
      end
    end
    str += "#{who} score: #{whose_hand.score}\n\n"
  end

  def hit_or_stand?
    print 'Hit or stand (H/S)?: '
    answer = gets.chomp.downcase
    answer =
    if answer == 'h'
      :hit
    elsif answer == 's'
      :stand
    else
      nil
    end
  end

  def play
    puts "Welcome to Blackjack!\n\n"
    puts show_hand(player)
    answer = hit_or_stand?

    while answer != :stand
      if answer == :hit
        player.hit
        puts show_hand(player)
        if player.score > 21
          puts "Bust! You lose..."
          break
        end
      else
        puts ">>> Invalid entry.\n\n"
      end
      answer = hit_or_stand?
    end

    if player.score <= 21
      puts show_hand(player, :stand)
      puts show_hand(computer)

      while computer.score < 17
        computer.hit
        puts show_hand(computer)
      end

      if computer.score <=21
        puts "Dealer stands.\n\n"
        if player.score == computer.score
          puts "Tie!"
        elsif player.score > computer.score
          puts "You win!"
        else
          puts "Dealer wins."
        end
      else
        puts "Bust! Dealer loses..."
      end
    end
  end
end

game = Blackjack.new
game.play
