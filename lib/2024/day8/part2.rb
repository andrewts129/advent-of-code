# frozen_string_literal: true

module Day8Part2
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

    def antenna
      @rows.flatten.uniq - ["."]
    end

    def select(value)
      new_rows = @rows.map { |r| r.join.tr("^[^#{value}]", ".").chars }
      self.class.new(new_rows)
    end

    def antenna_locations(value)
      result = []

      @rows.each.with_index do |row, y|
        row.each.with_index do |a, x|
          result << [x, y] if a == value
        end
      end

      result
    end

    def antinodes_for(value)
      antenna_locations(value).combination(2).flat_map do |left, right|
        [antinodes(left, right), antinodes(right, left)].flatten(1)
      end.compact
    end

    def antinodes(left, right)
      left_x, left_y = left
      right_x, right_y = right

      dx = right_x - left_x
      dy = right_y - left_y

      results = [left, right]

      loop do
        result = [right_x + dx, right_y + dy]
        break if get(*result).nil?
        
        results << result
        right_x, right_y = result
      end

      results
    end
  end

  def self.solution(lines)
    original_grid = Grid.parse(lines)
    locations = original_grid.antenna.flat_map do |antenna|
      grid = original_grid.select(antenna)
      grid.antinodes_for(antenna)
    end

    locations.uniq.count
  end
end
