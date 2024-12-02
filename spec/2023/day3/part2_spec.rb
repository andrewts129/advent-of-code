# frozen_string_literal: true

require "spec_helper"
require "2023/day3/part2"

describe Day3Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      TEXT

      it "returns the correct value" do
        expect(result).to eq(467835)
      end
    end

    context "on the sample input" do
      let(:input) { File.readlines("spec/2023/day3/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(76314915)
      end
    end
  end
end
