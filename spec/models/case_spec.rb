require 'spec_helper'

describe Case do

  describe "#new" do

    it "should have a valid path" do
      Case.new(path: "good").save.should be_true
    end

    it "should have no verdict" do
      Case.new(path: "good").verdict.should be_nil
    end

    it "can't have a path that doesn't exist" do
      Case.new(path: "foo").save.should be_false
    end

  end

  describe "existing cases" do

    before :each do
      @good = Case.new(path: "good")
      @bad  = Case.new(path: "bad")
    end
    
    it "should return the path to a case" do
      @good.build.should == "spec/fixtures/good"
      @bad.build.should  == "spec/fixtures/bad"
    end

    it "should return false when the case isn't found" do
      foo = Case.new(path: "foo")
      foo.build.should be_false
    end

    it "should return 'guilty' for cases that have bad files" do
      @good.trial.should == "not guilty"
    end

    it "should return 'not guilty' for cases don't have bad files" do
      @bad.trial.should == "guilty"
    end

    it "should have violations" do
      @good.violations.should be_empty
      @bad.violations.length.should == 3
    end

  end

  describe "searching cases" do
    it "should return a list of case directories relative to config.basepath" do
      Case.directories.should include("good", "parent1/parent2/nested")
    end

    it "should not include the root of config.basepath" do
      Case.directories.should_not include("")
      Case.directories.should_not include(nil)
    end
  end

end