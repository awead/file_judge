require 'spec_helper'

describe Case do

  describe "#new" do

    before :each do 
      @new = Case.new
    end

    it "should have a name and a path" do
      @new.name = "New Case"
      @new.path = "/path/to/files"
      @new.name.should == "New Case"
      @new.path.should == "/path/to/files"
      @new.save
      inst = Case.find(@new.id)
      inst.name.should == "New Case"
      inst.verdict.should be_nil
    end

    it "should have errors" do
      @new.save.should be_false
      @new.errors.messages[:path].first.should == "can't be blank"
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

end