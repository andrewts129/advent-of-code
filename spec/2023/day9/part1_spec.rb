# frozen_string_literal: true

require "spec_helper"
require "2023/day9/part1"

describe Day9Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        0 3 6 9 12 15
        1 3 6 10 15 21
        10 13 16 21 30 45
      TEXT

      it "returns the correct value" do
        expect(result).to eq(114)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2023/day9/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(1762065988)
      end
    end
  end
end
