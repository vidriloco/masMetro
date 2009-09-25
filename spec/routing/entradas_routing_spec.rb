require 'spec/spec_helper'

describe EntradasController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/entradas" }.should route_to(:controller => "entradas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/entradas/new" }.should route_to(:controller => "entradas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/entradas/1" }.should route_to(:controller => "entradas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/entradas/1/edit" }.should route_to(:controller => "entradas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/entradas" }.should route_to(:controller => "entradas", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/entradas/1" }.should route_to(:controller => "entradas", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/entradas/1" }.should route_to(:controller => "entradas", :action => "destroy", :id => "1") 
    end
  end
end
