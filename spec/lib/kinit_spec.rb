require 'spec_helper'

module Kinit
	describe Kinit do
	  it "should return true if a gem is present" do  
	    @gen = GemsEnforcer.new
	    element_data = @gen.CheckIsGemPresent
	    element_data.should_not be_nil
	    element_data.should == true
	  end
	end
end