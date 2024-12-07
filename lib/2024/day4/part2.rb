# frozen_string_literal: true

module Day4Part2
  class Grid
    def initialize(rows)
      @rows = rows
    end

    def self.parse(lines)
      new(lines.map { |l| l.strip.chars })
    end

    def get(x, y)
      return nil if x < 0 || y < 0
      @rows.dig(y, x)
    end

    def count
      @rows.flat_map.with_index do |row, y|
        row.map.with_index do |letter, x|
          xmas(letter, x, y)
        end
      end.sum
    end

    def xmas(letter, x, y)
      return 0 unless letter == "A"

      strings(x, y).count == 2 ? 1 : 0
    end

    def strings(x, y)
      [
        [get(x - 1, y - 1), get(x, y), get(x + 1, y + 1)],
        [get(x - 1, y + 1), get(x, y), get(x + 1, y - 1)],
        [get(x + 1, y - 1), get(x, y), get(x - 1, y + 1)],
        [get(x + 1, y + 1), get(x, y), get(x - 1, y - 1)]
      ].map do |letters|
        letters.compact.join
      end.select do |string|
        string == "MAS"
      end
    end
  end

  def self.solution(lines)
    Grid.parse(lines).count
  end
end
