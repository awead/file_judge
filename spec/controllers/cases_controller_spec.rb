require 'spec_helper'

describe CasesController do

  fixtures :cases

  it "should render a new case page" do
    get :new
    response.should be_success
  end

  it "should create new case" do
    post :create, :case => {:name => "New Case", :path => "path/to/case"}
    response.should be_redirect
  end

  it "should list all the cases" do
    get :index
    response.should be_success
  end

  it "should update a case" do
    put :update, :id => "1", :case => {name: "new name", path: "new path"}
    response.should be_redirect
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
