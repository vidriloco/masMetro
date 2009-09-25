# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe GenPassword do
  
  it "should create a new non empty password" do
    @gen = GenPassword.new
    @gen.password.should_not be_nil
  end
  
  describe "renewing the password" do
    it "should increase by 1 the genpassword record number if no password had been generated" do
      # Asegurarse de que no hay ningún registro previo para efectos de la prueba
      GenPassword.destroy_all
      lambda {
        GenPassword.create
      }.should change(GenPassword, :count).by(1)
    end
    
    it "should not increase the genpassword record number if previously generated password existed" do
      GenPassword.create
      lambda {
        GenPassword.create
      }.should_not change(GenPassword, :count)
    end
    
    it "should generate a different password from the previously existent one" do
      gen_passwd_1 = GenPassword.create
      gen_passwd_1.password.should_not be_eql(GenPassword.create.password)
    end
  end
  
  it "should remind the user when renewal is necessary" do
    gen = GenPassword.create
    GenPassword.should_not need_renewal
  end
  
  it "should validate correct password" do
    gen = GenPassword.create
    GenPassword.password_is_valid?(gen.password).should be_true
  end
  
  it "should not validate incorrect password" do
    GenPassword.create
    GenPassword.password_is_valid?("algoypassword").should_not be_true
  end
  
  it "should not validate nil password" do
    GenPassword.create
    GenPassword.password_is_valid?(nil).should_not be_true
  end
  
  it "should not validate when registration password is not set" do
    GenPassword.destroy_all
    GenPassword.password_is_valid?("algoypassword").should_not be_true    
  end
  
  it "should retrieve the current status of the generated password" do
    gen=GenPassword.create
    GenPassword.password_information.should be_eql("Generada: #{gen.password}")
  end
  
  it "should retrieve the current status of a not yet generated password" do
    GenPassword.destroy_all
    GenPassword.password_information.should be_eql("No ha sido generada")
  end
end