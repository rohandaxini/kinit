require "kinit/version"


module Kinit

  class GemsEnforcer

	#class GemNotPresent < Exception; end
	GemError         = Class.new(ArgumentError) 
	MinLengthError   = Class.new(ArgumentError)
	AlphabetError    = Class.new(ArgumentError)

  	attr_reader :error, :message

  	#def initialize (app, options={})  
    #end

    def initialize     		
    end

    def CheckIsGemPresent 
      #return true if Gem::Specification.find_by_name(gemName)      
      if Gem.available?('cane') 
      	puts "All good. Your project passes Kinit checks."
      	return true
      else
      	raise GemsEnforcer::GemError, "Please include gem 'cane' to the project."
      end
    end

    #def invalid_ruby_version
    #	@error = GemNotPresent
    #	@message = "Please include gem #{GEM_NAME} to the project."
  	#end

  end

end
