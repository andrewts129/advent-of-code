# frozen_string_literal: true

module Day3Part1
  def self.solution(lines)
    Schematic.parse_grid(lines).parts.sum { |p| p.label.to_i }
  end

  private

  Entity = Struct.new(:label, :coordinates, :keyword_init => true) do
    def self.parse_line(row_number, line)
      result = []

      buffer_label = ""
      buffer_coordinates = []

      line.strip.chars.each_with_index do |c, column_number|
        case c
        when /[0-9]/
          buffer_label += c
          buffer_coordinates << [row_number, column_number]
        else
          if buffer_label.length > 0
            result << Entity.new(:label => buffer_label, :coordinates => buffer_coordinates)
            buffer_label = ""
            buffer_coordinates = []
          end

          result << Entity.new(:label => c, :coordinates => [[row_number, column_number]]) unless c == "."
        end
      end

      result << Entity.new(:label => buffer_label, :coordinates => buffer_coordinates) if buffer_label.length > 0

      result
    end

    def number_label?
      label.match?(/[0-9]+/)
    end

    def symbol_label?
      !number_label?
    end
  end

  Schematic = Struct.new(:entities, :keyword_init => true) do
    def self.parse_grid(lines)
      new(
        :entities => lines.each_with_index.flat_map { |line, row_number| Entity.parse_line(row_number, line) }
      )
    end

    def parts
      entities.select(&:number_label?).select do |entity|
        adjacent_entities = _get_adjacent(entity)

        true if adjacent_entities.any?(&:symbol_label?)
      end
    end

    private

    def _get_adjacent(entity)
      result = Set.new

      entity.coordinates.each do |(i, j)|
        result.add(_entity_at(i + 1, j))
        result.add(_entity_at(i - 1, j))
        result.add(_entity_at(i, j + 1))
        result.add(_entity_at(i, j - 1))
        result.add(_entity_at(i - 1, j - 1))
        result.add(_entity_at(i - 1, j + 1))
        result.add(_entity_at(i + 1, j - 1))
        result.add(_entity_at(i + 1, j + 1))
      end

      result.to_a.compact
    end

    def _entity_at(i, j)
      @lookup_cache ||= {}
      @lookup_cache[[i, j]] ||= entities.detect { |e| e.coordinates.include?([i, j]) }
    end
  end
end
