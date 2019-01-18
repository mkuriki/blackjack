class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank}#{@suit}"
  end

  def ace?
    rank == 'A'
  end

  def face?
    ['J', 'Q', 'K'].include?(rank)
  end
end
