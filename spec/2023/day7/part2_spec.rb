# frozen_string_literal: true

require "spec_helper"
require "2023/day7/part2"

describe Day7Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
      TEXT

      it "returns the correct value" do
        expect(result).to eq(5905)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2023/day7/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(251037509)
      end
    end
  end
end
