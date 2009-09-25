require 'spec/spec_helper'

describe "/administraciones/index.html.erb" do
  include AdministracionesHelper

  before(:each) do
    assigns[:administraciones] = [
      stub_model(Administraciones),
      stub_model(Administraciones)
    ]
  end

  it "renders a list of administraciones" do
    render
  end
end
