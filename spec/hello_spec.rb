# frozen_string_literal: true

require "spec_helper"

require "hello"

describe "Hello world" do
  it "works" do
    expect(Hello.hello).to eq("Hello World!")
  end
end
