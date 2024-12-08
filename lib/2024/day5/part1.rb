# frozen_string_literal: true

module Day5Part1
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

    updates.select { |u| u.valid?(rules) }.map(&:middle_value).sum
  end
end
