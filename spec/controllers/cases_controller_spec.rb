require 'spec_helper'

describe CasesController do

  fixtures :cases

  it "should render a new case page" do
    get :new
    response.should be_success
  end

  describe "#new" do
  
    it "should create new case" do
      post :create, :case => {:name => "New Case", :path => "good"}
      response.should be_redirect
    end

    it "should not allow cases that don't build" do
      post :create, :case => {:name => "New Case", :path => "fake/path"}
      flash.alert.should == ["Unable to build a case from the supplied path. Did you enter it correctly?"]
    end

  end

  it "should list all the cases" do
    get :index
    response.should be_success
  end

  describe "#update" do
  
    it "should update a case" do
      put :update, :id => "1", :case => {name: "new name", path: "good"}
      flash.alert.should be_nil
      response.should be_redirect
    end

    it "should not update a case if it doesn't build" do
      put :update, :id => "1", :case => {name: "new name", path: "fake"}
      flash.alert.should == ["Unable to build a case from the supplied path. Did you enter it correctly?"]
    end
  
  end

  it "should edit a case" do
    get :edit, :id => "1"
    response.should be_success
  end

  it "should delete a case" do
    delete :destroy, :id => "1"
    response.should be_redirect
  end

end
