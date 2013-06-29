require 'spec_helper'

describe Case do

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
  end


end
