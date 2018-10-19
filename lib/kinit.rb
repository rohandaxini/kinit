Dir["tasks/*.rake"].each { |ext| load ext } if defined?(Rake)
require "kinit/version"
require 'yaml'

module Kinit
  require 'kinit/railtie' if defined?(Rails)

  class GemsEnforcer

	  GemError         = Class.new(ArgumentError)
    CONFIG_FILE      = "kinit_config.yml"

    def initialize(options={})
      default_config = File.join(File.dirname(__FILE__), "..", CONFIG_FILE)
      custom_config = File.join(base_path, 'config/kinit_config.yml')
      @config = File.exists?(custom_config) ? custom_config : default_config
    end

    def add_error(message)
      errors << message
    end

    def base_path=(path)
      @base_path = path
    end

    def base_path
      @base_path || "."
    end

    def checkGemsForCategory(gemListHash, category_name)
      if gemListHash.has_key?(category_name)
        gemListHash[category_name].each do |gemname|
          gem_available?(gemname) ?
            (plain_output "\nGem '#{gemname}' is present in your project. Neat." , 'green')
            :
            (add_error "Gem '#{gemname}' is not present in your project. Not Good.")
          # if Gem::Specification.find_by_name(gem)
          # raise GemsEnforcer::GemError, "Please include gem 'cane' to the project."
        end
      end
    end

    def CheckIsGemPresent
      gemListHash = YAML.load_file @config

      if gemListHash
          checkGemsForCategory(gemListHash, "bestPracticesGems")
          checkGemsForCategory(gemListHash, "testingGems")
          output_terminal_errors

          if gemListHash.has_key?("suggestions")
            gemListHash["suggestions"].each do |suggestion|
              plain_output "Kinit Suggestions: You may use tools like '#{suggestion}' for your project.", 'green'
            end
          end

          return true
      else
          plain_output "Please define checks in your config/kinit_config.yml to enforce best practices.", 'red'
          return false
      end
    end

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def errors
      @errors ||= []
    end

    def gem_available?(name)
      show_wait_cursor(0.3)
      Gem::Specification.find_by_name(name)
      rescue Gem::LoadError
        false
      rescue
        Gem.available?(name)
    end

    def output_terminal_errors
      if errors.empty?
        plain_output("\nNo observations. Your project has all good practices.", 'green')
      else
        puts
        @errors.each { |error| plain_output(error.to_s, 'red') }
        plain_output("\nFound #{errors.size} observation(s).", 'red')
      end
    end

    def plain_output(message, color)
      puts result = (color == "red" && red(message) ) || green(message)
    end

    def red(text); colorize(text, 31); end
    def green(text); colorize(text, 32); end

    def show_wait_cursor(seconds,fps=10)
      chars = %w[| / - \\]
      delay = 1.0/fps
      (seconds*fps).round.times{ |i|
        print chars[i % chars.length]
        sleep delay
        print "\b"
      }
    end

  end
end