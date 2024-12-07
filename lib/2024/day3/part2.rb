# frozen_string_literal: true

module Day3Part2
  class Instruction
    def initialize(left, right)
      @left = left 
      @right = right
    end

    def result
      @left * @right
    end
  end

  class InstructionSet
    def initialize(instructions)
      @instructions = instructions
    end

    def self.parse(input)
      enabled = true
      instructions = input.scan(/(mul\((\d{1,3}),(\d{1,3})\))|(do\(\))|(don't\(\))/).map do |result|
        if result[3] == "do()"
          enabled = true 
          next
        elsif result[4] == "don't()"
          enabled = false 
          next
        else
          next unless enabled

          _, left, right = result
          Instruction.new(left.to_i, right.to_i)
        end
      end.compact

      new(instructions)
    end

    def result
      @instructions.map(&:result).sum
    end
  end

  def self.solution(lines)
    InstructionSet.parse(lines.join).result
  end
end
