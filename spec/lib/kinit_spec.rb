require 'spec_helper'

module Kinit
	describe Kinit do
	  it "should return true if a gem is present" do
	    @gen = GemsEnforcer.new
	    element_data = @gen.CheckIsGemPresent
	    expect(element_data).not_to be_nil
	    expect(element_data).to be true
	  end
	end
end