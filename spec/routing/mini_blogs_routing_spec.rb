require 'spec/spec_helper'

describe MiniBlogsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/mini_blogs" }.should route_to(:controller => "mini_blogs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mini_blogs/new" }.should route_to(:controller => "mini_blogs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mini_blogs/1" }.should route_to(:controller => "mini_blogs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mini_blogs/1/edit" }.should route_to(:controller => "mini_blogs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mini_blogs" }.should route_to(:controller => "mini_blogs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/mini_blogs/1" }.should route_to(:controller => "mini_blogs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mini_blogs/1" }.should route_to(:controller => "mini_blogs", :action => "destroy", :id => "1") 
    end
  end
end
