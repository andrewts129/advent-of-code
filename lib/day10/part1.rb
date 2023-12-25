# frozen_string_literal: true

module Day10Part1
  def self.solution(lines)
    Grid.parse(lines).loop_size / 2
  end

  private

  Tile = Struct.new(:kind, :x, :y, :lookup, :keyword_init => true) do
    def start?
      kind == "S"
    end

    def pipe?
      kind != "."
    end

    def options
      _options_pos.filter_map { |pos| lookup[pos] }.select { |t| t.pipe? }
    end

    private

    def _options_pos
      case kind
      when "|" then [[x, y + 1], [x, y - 1]]
      when "-" then [[x + 1, y], [x - 1, y]]
      when "L" then [[x, y - 1], [x + 1, y]]
      when "J" then [[x, y - 1], [x - 1, y]]
      when "7" then [[x, y + 1], [x - 1, y]]
      when "F" then [[x, y + 1], [x + 1, y]]
      when "S" then [[x, y + 1], [x, y - 1], [x - 1, y], [x + 1, y]]
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

    def loop_size
      _loop.size
    end

    private

    def _loop
      start = _start

      start.options.each do |initial_move|
        seen = Set.new
        seen.add(start)

        current = initial_move

        loop do
          seen.add(current)

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
