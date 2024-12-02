# frozen_string_literal: true

module Day10Part2
  def self.solution(lines)
    Grid.parse(lines).tiles_enclosed_by_loop
  end

  private

  Tile = Struct.new(:kind, :x, :y, :lookup, :keyword_init => true) do
    def start?
      kind == "S"
    end

    def pipe?
      kind != "."
    end

    def neighbors
      _all_neighbors_pos.filter_map { |pos| lookup[pos] }
    end

    def options
      _options_pos.filter_map { |pos| lookup[pos] }.select { |t| t.pipe? }
    end

    def inspect
      to_h.except(:lookup).inspect
    end

    private

    def _all_neighbors_pos
      [[x, y + 1], [x, y - 1], [x - 1, y], [x + 1, y]]
    end

    def _options_pos
      case kind
      when "|" then [[x, y + 1], [x, y - 1]]
      when "-" then [[x + 1, y], [x - 1, y]]
      when "L" then [[x, y - 1], [x + 1, y]]
      when "J" then [[x, y - 1], [x - 1, y]]
      when "7" then [[x, y + 1], [x - 1, y]]
      when "F" then [[x, y + 1], [x + 1, y]]
      when "S" then _all_neighbors_pos
      else []
      end
    end
  end

  Grid = Struct.new(:rows, :keyword_init => true) do
    def self.parse(lines)
      tile_lookup = {}

      new(
        :rows => lines.each_with_index.map do |row, y|
          row.strip.chars.each_with_index.map do |column_value, x|
             Tile.new(:kind => column_value, :x => x, :y => y, :lookup => tile_lookup).tap do |tile|
                tile_lookup[[x, y]] = tile
             end
          end
        end
      )
    end

    def tiles_enclosed_by_loop
      _area(_loop) + 1 - (_loop.size / 2)
    end

    private

    def _area(region)
      area = (region + [region.first]).each_cons(2).sum do |a, b|
        (a.x * b.y) - (a.y * b.x) 
      end / 2

      area.positive? ? area : _area(region.reverse)
    end

    def _loop
      @loop ||= _compute_loop
    end

    def _compute_loop
      start = _start

      start.options.each do |initial_move|
        seen = []
        seen << start

        current = initial_move

        loop do
          seen << current

          options_for_next = current.options
          potential_moves = options_for_next.reject { |o| seen.include?(o) }

          if potential_moves.empty?
            return seen if options_for_next.include?(start)

            break
          else
            current = potential_moves.first
          end
        end
      end
    end

    def _start
      rows.flatten.detect { |t| t.start? }
    end
  end
end
