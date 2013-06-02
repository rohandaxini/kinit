Dir["tasks/*.rake"].each { |ext| load ext } if defined?(Rake)
require "kinit/version"
require 'yaml'

module Kinit
  require 'kinit/railtie' if defined?(Rails)

  class GemsEnforcer

	  GemError         = Class.new(ArgumentError)
  	  
    def initialize(options={})
      default_config = File.join(File.dirname(__FILE__), "..", "kinit_config.yml")
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

    def CheckIsGemPresent 
      gemList = YAML.load_file @config
      #puts gemList.inspect
      if !gemList.nil?
          gemList["bestPracticesGems"].each do |gemname|
            if Gem.available?(gemname)              
              plain_output "Gem '#{gemname}' is present in your project. Neat." , 'green'
            else
              add_error "Gem '#{gemname}' is not present in your project. Not Good."           
            end
            # if Gem::Specification.find_by_name(gem) 
            # raise GemsEnforcer::GemError, "Please include gem 'cane' to the project."        
          end

          output_terminal_errors

          gemList["suggestions"].each do |suggestion|
            plain_output "Suggestion - You should use tools like #{suggestion} for your project.", 'green'
          end

          return true
      else
          return false
      end      
    end 

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def errors
      @errors ||= []
    end
    
    def output_terminal_errors
      if errors.empty?
        plain_output("\nNo issues or errors found. Cool! Your project passed Kinit checks.", 'green')
      else
        @errors.each { |error| plain_output(error.to_s, 'red') }         
        plain_output("\nFound #{errors.size} errors.", 'red')
      end
    end

    def plain_output(message, color)
      puts result = (color == "red" && red(message) ) || green(message)        
    end

    def red(text); colorize(text, 31); end
    def green(text); colorize(text, 32); end

  end 
end 