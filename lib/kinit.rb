Dir["tasks/*.rake"].each { |ext| load ext } if defined?(Rake)

require "kinit/version"


module Kinit
  require 'kinit/railtie' if defined?(Rails)

  class GemsEnforcer

	  #attr_reader :error, :message
	  GemError         = Class.new(ArgumentError) 
 
 	  #def initialize (app, options={}) end
    #def initialize end

    def CheckIsGemPresent       
      gemList = ["cane","rails_best_practices", "reek", "simplecov"]      

      gemList.each do |gemname|
        add_error "Gem '#{gemname}' is not present in your project. Not Good." if !Gem.available?(gemname)                          
        # puts "Checking if Gem '#{gemname}' present."

        # if Gem::Specification.find_by_name(gem) 
        # raise GemsEnforcer::GemError, "Please include gem 'cane' to the project."        
      end
      
      output_terminal_errors
      plain_output "Suggestion - You should use tools like 'CodeClimate' for your project. Ignore if already included.", 'green'

      return true      
    end 

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def red(text); colorize(text, 31); end
    def green(text); colorize(text, 32); end

    def errors
      @errors ||= []
    end

    def add_error(message)
      errors << message
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

  end # Class ends here
end #module ends here