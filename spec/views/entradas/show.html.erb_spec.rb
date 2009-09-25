require 'spec/spec_helper'

describe "/entradas/show.html.erb" do
  include EntradasHelper
  before(:each) do
    assigns[:entrada] = @entrada = stub_model(Entrada,
      :titulo => "value for titulo",
      :contenido => "value for contenido",
      :visible => false,
      :mini_blog_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ titulo/)
    response.should have_text(/value\ for\ contenido/)
    response.should have_text(/false/)
    response.should have_text(/1/)
  end
end
