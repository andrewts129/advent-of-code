# frozen_string_literal: true

require "spec_helper"
require "2024/day2/part1"

describe Day2Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
      TEXT

      it "returns the correct value" do
        expect(result).to eq(2)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day2/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(220)
      end
    end
  end
end
