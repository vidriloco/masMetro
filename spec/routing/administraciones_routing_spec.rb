require 'spec/spec_helper'

describe AdministracionesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/administraciones" }.should route_to(:controller => "administraciones", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/administraciones/new" }.should route_to(:controller => "administraciones", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/administraciones/1" }.should route_to(:controller => "administraciones", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/administraciones/1/edit" }.should route_to(:controller => "administraciones", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/administraciones" }.should route_to(:controller => "administraciones", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/administraciones/1" }.should route_to(:controller => "administraciones", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/administraciones/1" }.should route_to(:controller => "administraciones", :action => "destroy", :id => "1") 
    end
  end
end
