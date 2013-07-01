require 'spec_helper'

describe CaseMethods do

  describe "building a case" do
    
    it "should return the path to a case" do
      good = Case.new(path: "good")
      bad  = Case.new(path: "bad")
      good.build.should == "spec/fixtures/good"
      bad.build.should  == "spec/fixtures/bad"
    end

    it "should return false when the case isn't found" do
      foo = Case.new(path: "foo")
      foo.build.should be_false
    end
  end

end