# frozen_string_literal: true

module Day7Part2
  def self.solution(lines)
    _hands(lines).sort.each_with_index.sum do |hand, index|
      hand.bid * (index + 1)
    end
  end

  private

  Hand = Struct.new(:bid, :cards, :keyword_init => true) do
    CARDS = %w[A K Q T 9 8 7 6 5 4 3 2 J]

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
        card_strengths = CARDS.reverse.each_with_index.to_h { |c, i| [c, i] }

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
      @type ||= _compute_type
    end

    private

    def _compute_type
      [:_five_of_a_kind, :_four_of_a_kind, :_full_house, :_three_of_a_kind, :_two_pair, :_one_pair].each do |possible_type|
        result = send(possible_type)

        return result unless result.nil?
      end

      "high_card"
    end

    def _with_joker_subs
      _joker_subs.each do |card_set|
        yield(card_set)
      end
    end

    def _joker_subs(card_set = cards)
      return [card_set] unless card_set.include?("J")

      CARDS.flat_map do |possible_sub|
        next [] if possible_sub == "J"

        joker_pos = card_set.index("J")
        card_set_with_sub = card_set.dup
        card_set_with_sub[joker_pos] = possible_sub

        _joker_subs(card_set_with_sub).reject { |c| c.include?("J") }
      end
    end

    def _five_of_a_kind
      _with_joker_subs do |card_set|
        return "five_of_a_kind" if card_set.uniq.length == 1
      end

      nil
    end

    def _four_of_a_kind
      _with_joker_subs do |card_set|
        return "four_of_a_kind" if card_set.tally.values.sort == [1, 4]
      end

      nil
    end

    def _full_house
      _with_joker_subs do |card_set|
        return "full_house" if card_set.tally.values.sort == [2, 3]
      end

      nil
    end

    def _three_of_a_kind
      _with_joker_subs do |card_set|
        return "three_of_a_kind" if card_set.tally.values.sort == [1, 1, 3]
      end

      nil
    end

    def _two_pair
      _with_joker_subs do |card_set|
        return "two_pair" if card_set.tally.values.sort == [1, 2, 2]
      end

      nil
    end

    def _one_pair
      _with_joker_subs do |card_set|
        return "one_pair" if card_set.tally.values.sort == [1, 1, 1, 2]
      end

      nil
    end
  end

  def self._hands(lines)
    lines.map { |l| Hand.parse(l) }
  end
end
