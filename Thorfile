class GenerateTemplate < Thor::Group
  include Thor::Actions

  class_option :day
  class_option :part

  def self.source_root
    File.join(File.dirname(__FILE__), "lib/templates")
  end

  def new_challenge
    template("new_impl.tt", "./lib/day#{options[:day]}/part#{options[:part]}.rb")
  end

  def new_test
    template("new_test.tt", "./spec/day#{options[:day]}/part#{options[:part]}_spec.rb")
  end

  def new_input
    template("new_input.tt", "./spec/day#{options[:day]}/input.txt")
  end
end