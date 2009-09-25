require 'spec/spec_helper'

describe "/administraciones/new.html.erb" do
  include AdministracionesHelper

  before(:each) do
    assigns[:administraciones] = stub_model(Administraciones,
      :new_record? => true
    )
  end

  it "renders new administraciones form" do
    render

    response.should have_tag("form[action=?][method=post]", administraciones_path) do
    end
  end
end
