# frozen_string_literal: true

require "set"

module Day6Part2
  class GridState
    attr_reader :rows

    def initialize(rows, guard_x, guard_y, guard_dir, seen = Set.new)
      @rows = rows
      @guard_x = guard_x
      @guard_y = guard_y
      @guard_dir = guard_dir
      @seen = seen
    end

    def self.parse(lines)
      rows = lines.map { |l| l.strip.chars }
      guard_y = rows.find_index { |r| r.include?("^") }
      guard_x = rows[guard_y].index("^")

      new(rows, guard_x, guard_y, "up")
    end

    def add_obstacle(x, y)
      return nil if ["^", "#"].include?(get(x, y))

      new_rows = @rows.map(&:dup)
      new_rows[y][x] = "#"

      self.class.new(new_rows, @guard_x, @guard_y, @guard_dir)
    end

    def get(x, y)
      return nil if x < 0 || y < 0

      @rows.dig(y, x)
    end

    def loops?
      return false if get(@guard_x, @guard_y).nil?
      return true if @seen.include?([@guard_x, @guard_y, @guard_dir])

      @seen.add([@guard_x, @guard_y, @guard_dir])

      next_x, next_y = guard_next
      if get(next_x, next_y) == "#"
        self.class.new(@rows, @guard_x, @guard_y, next_dir, @seen).loops?
      else
        self.class.new(@rows, next_x, next_y, @guard_dir, @seen).loops?
      end
    end

    def guard_next
      case @guard_dir
      when "up" then [@guard_x, @guard_y - 1]
      when "down" then [@guard_x, @guard_y + 1]
      when "left" then [@guard_x - 1, @guard_y]
      when "right" then [@guard_x + 1, @guard_y]
      end
    end

    def next_dir
      case @guard_dir
      when "up" then "right"
      when "down" then "left"
      when "left" then "up"
      when "right" then "down"
      end
    end
  end

  def self.solution(lines)
    original_grid = GridState.parse(lines)

    grids = [original_grid]
    (0...(original_grid.rows.length)).each do |y|
      (0...(original_grid.rows.first.length)).each do |x|
        grids << original_grid.add_obstacle(x, y)
      end
    end

    grids.compact!

    #puts "grids to search #{grids.length}"

    i = 0
    grids.count do |grid|
      result = grid.loops?
      #puts "searched #{i}"
      i += 1
      result
    end
  end
end
