# frozen_string_literal: true

require "spec_helper"
require "day7/part1"

describe Day7Part1 do
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
        expect(result).to eq(6440)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/day7/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(250602641)
      end
    end
  end
end
