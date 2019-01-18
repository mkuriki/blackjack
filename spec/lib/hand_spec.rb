require "spec_helper"

describe Hand do
  # UTF-8 characters: '♦', '♣', '♠', '♥'
  let(:hand1) { Hand.new([Card.new(10, "♦"), Card.new("J", "♥")]) }
  let(:hand2) { Hand.new([Card.new("A", "♣"), Card.new("A", "♠")]) }
  let(:hand3) { Hand.new([Card.new("A", "♦"), Card.new("Q", "♥")]) }
  let(:hand4) { Hand.new([Card.new(3, "♥"), Card.new(4, "♦")]) }
  let(:hand5) { Hand.new([Card.new(6, "♦"), Card.new("A", "♥")]) }
  let(:hand6) { Hand.new([]) }

  describe "#score" do
    it "passes" do
      expect(hand1.score).to eq(20)
      expect(hand2.score).to eq(12)
      expect(hand3.score).to eq(21)
      expect(hand4.score).to eq(7)
      expect(hand5.score).to eq(17)
    end

    it "fails" do
      expect(hand6.score).to eq(0)
    end

  end
end
