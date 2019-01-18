class Hand
  attr_reader :cards
  attr_reader :name

  def initialize(deck, name)
    @deck = deck
    @name = name
    @cards = @deck.deal(2)
  end

  def hit
    @cards += @deck.deal(1)
    cards[-1]
  end

  def score
    score = 0
    @cards.each do |card|
      score = score +
        if card.ace?
          score + 11 > 21 ? 1 : 11
        elsif card.face?
          10
        else
          card.rank.to_i
        end
    end
    score
  end
end
