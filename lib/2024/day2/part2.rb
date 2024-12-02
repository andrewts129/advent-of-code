# frozen_string_literal: true

module Day2Part2
  class Level
    def initialize(values)
      @values = values
    end

    def safe?
      sub_values = @values.map.with_index.map do |_, i|
        self.class.new(
          @values.dup.tap { |v| v.delete_at(i) }
        )
      end
      safe_as_is? || sub_values.any?(&:safe_as_is?)
    end

    def safe_as_is?
      diffs = @values.each_cons(2).map { |n1, n2| n2 - n1 }

      if @values.sort == @values
        diffs.all? { |d| d >= 1 && d <= 3 }
      elsif @values.sort == @values.reverse
        diffs.map { |x| x * -1 }.all? { |d| d >= 1 && d <= 3 }
      else
        false
      end
    end
  end

  class Report
    def initialize(levels)
      @levels = levels
    end

    def self.parse(lines)
      levels = lines.map { |line| line.split.map(&:to_i) }.map { |numbers| Level.new(numbers) }
      new(levels)
    end

    def num_safe
      @levels.count(&:safe?)
    end
  end

  def self.solution(lines)
    Report.parse(lines).num_safe
  end
end
