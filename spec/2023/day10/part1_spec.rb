# frozen_string_literal: true

require "spec_helper"
require "2023/day10/part1"

describe Day10Part1 do
  describe ".solution" do
    subject(:result) { described_class.solution(input) }

    context "on the first sample input" do
      let(:input) { <<~TEXT.split("\n") }
        .....
        .S-7.
        .|.|.
        .L-J.
        .....
      TEXT

      it "returns the correct value" do
        expect(result).to eq(4)
      end
    end

    context "on the second sample input" do
      let(:input) { <<~TEXT.split("\n") }
        -L|F7
        7S-7|
        L|7||
        -L-J|
        L|-JF
      TEXT

      it "returns the correct value" do
        expect(result).to eq(4)
      end
    end

    context "on the third sample input" do
      let(:input) { <<~TEXT.split("\n") }
        7-F7-
        .FJ|7
        SJLL7
        |F--J
        LJ.LJ
      TEXT

      it "returns the correct value" do
        expect(result).to eq(8)
      end
    end

    context "on the real input" do
      let(:input) { File.readlines("spec/2023/day10/input.txt") }

      it "returns the correct value" do
        expect(result).to eq(6815)
      end
    end
  end
end
