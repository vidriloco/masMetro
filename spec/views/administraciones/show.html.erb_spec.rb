require 'spec/spec_helper'

describe "/administraciones/show.html.erb" do
  include AdministracionesHelper
  before(:each) do
    assigns[:administraciones] = @administraciones = stub_model(Administraciones)
  end

  it "renders attributes in <p>" do
    render
  end
end
