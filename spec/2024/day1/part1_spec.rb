# frozen_string_literal: true

require "spec_helper"
require "2024/day1/part1"

describe Day1Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3      
      TEXT

      it "returns the correct value" do
        expect(result).to eq(11)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day1/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(1320851)
      end
    end
  end
end
