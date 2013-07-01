require 'spec_helper'

describe CaseBehaviors do

  before :each do
    class TestCase
      attr_accessor :path
      include CaseBehaviors
    end
    @test = TestCase.new 
  end

  describe "building a case" do
    
    it "should return the path to a case" do
      @test.path = "good"
      @test.build.should == "spec/fixtures/good"
      @test.path = "bad"
      @test.build.should  == "spec/fixtures/bad"
    end

    it "should return false when the case isn't found" do
      @test.path = "foo"
      @test.build.should be_false
    end
  end

end