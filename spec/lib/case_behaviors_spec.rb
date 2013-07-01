require 'spec_helper'

describe CaseBehaviors do

  before :each do
    class TestCase
      include CaseBehaviors
    end
    @test = TestCase.new 
  end

  describe "building a case" do
    
    it "should return the path to a case" do
      @test.build_case("good").should == "spec/fixtures/good"
      @test.build_case("bad").should  == "spec/fixtures/bad"
    end

    it "should return false when the case isn't found" do
      @test.build_case("foo").should be_false
    end
  end

end