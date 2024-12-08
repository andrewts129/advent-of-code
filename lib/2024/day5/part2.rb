# frozen_string_literal: true

module Day5Part2
  class Rule
    attr_reader :left, :right

    def initialize(left, right)
      @left = left 
      @right = right 
    end

    def self.parse(line)
      left, right = line.split("|")
      new(left.to_i, right.to_i)
    end

    def allows?(numbers)
      left_idx = numbers.index(left)
      right_idx = numbers.index(right)
      return true if left_idx.nil? || right_idx.nil?

      left_idx < right_idx
    end

    def to_a
      [left, right]
    end
  end

  class Update
    def initialize(numbers)
      @numbers = numbers
    end

    def self.parse(line)
      new(line.split(",").map(&:to_i))
    end

    def valid?(rules)
      rules.all? { |rule| rule.allows?(@numbers) }
    end

    def middle_value
      @numbers[@numbers.length / 2]
    end

    def reorder(rules)
      return self if valid?(rules)

      broken_rules = rules.select { |rule| !rule.allows?(@numbers) }
      left, right = broken_rules.first.to_a

      new_numbers = @numbers.dup
      new_numbers[@numbers.index(left)] = right
      new_numbers[@numbers.index(right)] = left

      self.class.new(new_numbers).reorder(rules)
    end
  end

  def self.solution(lines)
    rules = []
    updates = []

    lines.each do |line|
      if line.include?("|")
        rules << Rule.parse(line.strip)
      elsif line.strip.length > 0
        updates << Update.parse(line.strip)
      end
    end

    updates.select { |u| !u.valid?(rules) }.map { |u| u.reorder(rules) }.map(&:middle_value).sum
  end
end
