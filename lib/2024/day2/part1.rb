# frozen_string_literal: true

module Day2Part1
  class Report
    def initialize(levels)
      @levels = levels
    end

    def self.parse(lines)
      levels = lines.map { |line| line.split.map(&:to_i) }
      new(levels)
    end

    def num_safe
      @levels.count { |l| safe?(l) }
    end

    def safe?(level)
      diffs = level.each_cons(2).map { |n1, n2| n2 - n1 }

      if level.sort == level
        diffs.all? { |d| d >= 1 && d <= 3 }
      elsif level.sort == level.reverse
        diffs.map { |x| x * -1 }.all? { |d| d >= 1 && d <= 3 }
      else
        false
      end
    end
  end

  def self.solution(lines)
    Report.parse(lines).num_safe
  end
end
