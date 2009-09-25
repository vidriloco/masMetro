require 'spec/spec_helper'

describe MiniBlog do
  before(:each) do
    @valid_attributes = {
      :nombre => "value for nombre",
      :descripcion => "value for descripcion"
    }
  end

  it "should create a new instance given valid attributes" do
    MiniBlog.create!(@valid_attributes)
  end
  
  it "should return a message when no description had been given" do
    @m=MiniBlog.create!(:nombre => "Algo")
    @m.descripcion_.should be_eql("Sin descripción")
  end
end
