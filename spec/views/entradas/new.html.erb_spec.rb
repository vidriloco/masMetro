require 'spec/spec_helper'

describe "/entradas/new.html.erb" do
  include EntradasHelper

  before(:each) do
    assigns[:entrada] = stub_model(Entrada,
      :new_record? => true,
      :titulo => "value for titulo",
      :contenido => "value for contenido",
      :visible => false,
      :mini_blog_id => 1
    )
  end

  it "renders new entrada form" do
    render

    response.should have_tag("form[action=?][method=post]", entradas_path) do
      with_tag("input#entrada_titulo[name=?]", "entrada[titulo]")
      with_tag("textarea#entrada_contenido[name=?]", "entrada[contenido]")
      with_tag("input#entrada_visible[name=?]", "entrada[visible]")
      with_tag("input#entrada_mini_blog_id[name=?]", "entrada[mini_blog_id]")
    end
  end
end
