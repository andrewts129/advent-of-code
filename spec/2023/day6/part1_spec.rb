# frozen_string_literal: true

require "spec_helper"
require "2023/day6/part1"

describe Day6Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        Time:      7  15   30
        Distance:  9  40  200
      TEXT

      it "returns the correct value" do
        expect(result).to eq(288)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2023/day6/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(2065338)
      end
    end
  end
end
