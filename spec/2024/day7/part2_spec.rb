# frozen_string_literal: true

require "spec_helper"
require "2024/day7/part2"

describe Day7Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        190: 10 19
        3267: 81 40 27
        83: 17 5
        156: 15 6
        7290: 6 8 6 15
        161011: 16 10 13
        192: 17 8 14
        21037: 9 7 18 13
        292: 11 6 16 20
      TEXT

      it "returns the correct value" do
        expect(result).to eq(11387)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day7/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(92612386119138)
      end
    end
  end
end
