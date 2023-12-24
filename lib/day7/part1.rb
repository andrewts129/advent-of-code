# frozen_string_literal: true

module Day7Part1
  def self.solution(lines)
    _hands(lines).sort.each_with_index.sum do |hand, index|
      hand.bid * (index + 1)
    end
  end

  private

  Hand = Struct.new(:bid, :cards, :keyword_init => true) do
    def self.parse(line)
      cards, bid = line.split

      new(
        :cards => cards.chars,
        :bid => bid.to_i
      )
    end

    def <=>(other)
      type_strengths = {
        "five_of_a_kind" => 7,
        "four_of_a_kind" => 6,
        "full_house" => 5,
        "three_of_a_kind" => 4,
        "two_pair" => 3,
        "one_pair" => 2,
        "high_card" => 1
      }

      if type_strengths[type] > type_strengths[other.type]
        1
      elsif type_strengths[type] < type_strengths[other.type]
        -1
      else
        card_strengths = %w[A K Q J T 9 8 7 6 5 4 3 2].reverse.each_with_index.to_h { |c, i| [c, i] }

        cards.zip(other.cards).each do |card, other_card|
          if card_strengths[card] > card_strengths[other_card]
            return 1
          elsif card_strengths[card] < card_strengths[other_card]
            return -1
          end
        end
      end
    end

    def type
      [
        _five_of_a_kind,
        _four_of_a_kind,
        _full_house,
        _three_of_a_kind,
        _two_pair,
        _one_pair,
        "high_card"
      ].compact.first
    end

    private

    def _five_of_a_kind
      return "five_of_a_kind" if cards.uniq.length == 1

      nil
    end

    def _four_of_a_kind
      return "four_of_a_kind" if cards.tally.values.sort == [1, 4]

      nil
    end

    def _full_house
      return "full_house" if cards.tally.values.sort == [2, 3]

      nil
    end

    def _three_of_a_kind
      return "three_of_a_kind" if cards.tally.values.sort == [1, 1, 3]

      nil
    end

    def _two_pair
      return "two_pair" if cards.tally.values.sort == [1, 2, 2]

      nil
    end

    def _one_pair
      return "one_pair" if cards.tally.values.sort == [1, 1, 1, 2]

      nil
    end
  end

  def self._hands(lines)
    lines.map { |l| Hand.parse(l) }
  end
end
