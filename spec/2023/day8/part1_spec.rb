# frozen_string_literal: true

require "spec_helper"
require "2023/day8/part1"

describe Day8Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the first sample input" do
      let(:input) { <<~TEXT.split("\n") }
        RL

        AAA = (BBB, CCC)
        BBB = (DDD, EEE)
        CCC = (ZZZ, GGG)
        DDD = (DDD, DDD)
        EEE = (EEE, EEE)
        GGG = (GGG, GGG)
        ZZZ = (ZZZ, ZZZ)
      TEXT

      it "returns the correct value" do
        expect(result).to eq(2)
      end
    end

    context "on the second sample input" do
      let(:input) { <<~TEXT.split("\n") }
        LLR

        ZZZ = (ZZZ, ZZZ)
        BBB = (AAA, ZZZ)
        AAA = (BBB, BBB)
      TEXT

      it "returns the correct value" do
        expect(result).to eq(6)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2023/day8/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(14681)
      end
    end
  end
end
