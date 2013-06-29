require 'spec_helper'

describe CasesController do

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

end
