require 'spec/spec_helper'

describe AdministracionesController do
  
  before(:each) do
    @usuario = Factory.create(:user_administrator)
    controller.stub!(:current_user).and_return @usuario
  end
  
  describe "registration_password" do
    
    it "generates password" do
      GenPassword.should_receive(:create)
      post :registration_password
    end
    
    it "retrieves database stored password" do
      GenPassword.should_receive(:find).with(:first)
      get :registration_password
    end
    
    it "asigns password when retrieved from database" do
      # No hacemos uso de Factory dado que en éste modelo no provee la 
      # funcionalidadque provee el método 'create' de GenPassword
      password_object = GenPassword.create
      get :registration_password
      assigns[:genpassword].password.should == password_object.password
    end
    
    it "asigns password when generated on the fly" do
      # No hacemos uso de Factory dado que en éste modelo no provee la 
      # funcionalidadque provee el método 'create' de GenPassword
      password_object = GenPassword.create
      post :registration_password
      assigns[:genpassword].password.should_not == password_object.password
    end
  end

end
