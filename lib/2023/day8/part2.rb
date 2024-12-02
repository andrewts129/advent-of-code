# frozen_string_literal: true

module Day8Part2
  def self.solution(lines)
    instructions, nodes = _parse_input(lines)

    starting_nodes = nodes.select { |n| n.label.end_with?("A") }
    steps_required = starting_nodes.map { |n| _steps_required(n, instructions) }

    steps_required.reduce(1, :lcm)
  end

  private

  def self._steps_required(node, instructions)
    current = node

    instructions_cycle = instructions.cycle

    steps_taken = 0
    until current.label.end_with?("Z")
      instruction = instructions_cycle.next

      if instruction == "L"
        current = current.left
      else
        current = current.right
      end

      steps_taken += 1
    end

    steps_taken
  end

  Node = Struct.new(:label, :left_label, :right_label, :node_lookup, :keyword_init => true) do
    def self.parse(line, node_lookup)
      label, left_label, right_label = line.strip.match(/(\w\w\w) = \((\w\w\w), (\w\w\w)\)/).captures

      new(
        :label => label,
        :left_label => left_label,
        :right_label => right_label,
        :node_lookup => node_lookup
      ).tap do |node|
        node_lookup[label] = node
      end
    end

    def left
      node_lookup[left_label]
    end

    def right
      node_lookup[right_label]
    end
  end

  def self._parse_input(lines)
    instructions = lines[0].strip.chars

    node_lookup = {}

    nodes = lines[2..].map { |line| Node.parse(line, node_lookup) }

    return [instructions, nodes]
  end
end
