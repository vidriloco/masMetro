require 'spec/spec_helper'

describe Entrada do
  before(:each) do
    @valid_attributes = {
      :titulo => "value for titulo",
      :contenido => "value for contenido",
      :visible => false,
      :mini_blog_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Entrada.create!(@valid_attributes)
  end
end
