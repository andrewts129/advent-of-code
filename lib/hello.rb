#!/usr/bin/env ruby
# frozen_string_literal: true

module Hello
  def self.hello
    "Hello World!"
  end
end

Hello.hello if __FILE__ == $PROGRAM_NAME
