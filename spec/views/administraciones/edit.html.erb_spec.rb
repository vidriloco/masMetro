require 'spec/spec_helper'

describe "/administraciones/edit.html.erb" do
  include AdministracionesHelper

  before(:each) do
    assigns[:administraciones] = @administraciones = stub_model(Administraciones,
      :new_record? => false
    )
  end

  it "renders the edit administraciones form" do
    render

    response.should have_tag("form[action=#{administraciones_path(@administraciones)}][method=post]") do
    end
  end
end
