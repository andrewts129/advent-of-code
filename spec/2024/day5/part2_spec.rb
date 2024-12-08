# frozen_string_literal: true

require "spec_helper"
require "2024/day5/part2"

describe Day5Part2 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the sample input" do
      let(:input) { <<~TEXT.split("\n") }
        47|53
        97|13
        97|61
        97|47
        75|29
        61|13
        75|53
        29|13
        97|29
        53|29
        61|53
        97|53
        61|29
        47|13
        75|47
        97|75
        47|61
        75|61
        47|29
        75|13
        53|13

        75,47,61,53,29
        97,61,53,29,13
        75,29,13
        75,97,47,61,53
        61,13,29
        97,13,75,29,47
      TEXT

      it "returns the correct value" do
        expect(result).to eq(123)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2024/day5/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(4598)
      end
    end
  end
end
