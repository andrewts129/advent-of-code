# frozen_string_literal: true

require "set"

module Day6Part1
  class GridState
    def initialize(rows, guard_x, guard_y, guard_dir, seen = Set.new([[guard_x, guard_y]]))
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

    def get(x, y)
      return nil if x < 0 || y < 0

      @rows.dig(y, x)
    end

    def steps_left
      return 0 if get(@guard_x, @guard_y).nil?

      next_x, next_y = guard_next
      if get(next_x, next_y) == "#"
        self.class.new(@rows, @guard_x, @guard_y, next_dir, @seen).steps_left
      elsif @seen.include?([next_x, next_y])
        self.class.new(@rows, next_x, next_y, @guard_dir, @seen).steps_left
      else
        @seen.add([next_x, next_y])
        1 + self.class.new(@rows, next_x, next_y, @guard_dir, @seen).steps_left
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
    GridState.parse(lines).steps_left
  end
end
