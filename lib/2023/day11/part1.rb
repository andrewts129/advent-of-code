# frozen_string_literal: true

module Day11Part1
  def self.solution(lines)
    Grid.parse(lines).galaxies.combination(2).sum do |a, b|
      a.distance_to(b)
    end
  end

  private

  Galaxy = Struct.new(:x, :y, :keyword_init => true) do
    def distance_to(other)
      (x - other.x).abs + (y - other.y).abs
    end
  end

  Grid = Struct.new(:rows, :keyword_init => true) do
    def self.parse(lines)
      rows = _expand_space(lines).each_with_index.map do |row, y|
        row.each_with_index.map do |val, x|
          val == "#" ? Galaxy.new(:x => x, :y => y) : val
        end
      end

      new(:rows => rows)
    end

    def galaxies
      rows.flatten.filter_map { |v| v if v.is_a?(Galaxy) }
    end 

    private 

    def self._expand_space(lines)
      grid = lines.map(&:strip).map(&:chars)
      _expand_rows(_expand_rows(grid).transpose).transpose
    end

    def self._expand_rows(rows)
      rows.flat_map do |row|
        result = [row]
        result << row unless row.include?("#")
        result
      end
    end
  end
end
