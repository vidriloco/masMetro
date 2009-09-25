require 'spec/spec_helper'

describe "/entradas/index.html.erb" do
  include EntradasHelper

  before(:each) do
    assigns[:entradas] = [
      stub_model(Entrada,
        :titulo => "value for titulo",
        :contenido => "value for contenido",
        :visible => false,
        :mini_blog_id => 1
      ),
      stub_model(Entrada,
        :titulo => "value for titulo",
        :contenido => "value for contenido",
        :visible => false,
        :mini_blog_id => 1
      )
    ]
  end

  it "renders a list of entradas" do
    render
    response.should have_tag("tr>td", "value for titulo".to_s, 2)
    response.should have_tag("tr>td", "value for contenido".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
