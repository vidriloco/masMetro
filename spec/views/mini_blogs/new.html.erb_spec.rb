require 'spec/spec_helper'

describe "/mini_blogs/new.html.erb" do
  include MiniBlogsHelper

  before(:each) do
    assigns[:mini_blog] = stub_model(MiniBlog,
      :new_record? => true,
      :nombre => "value for nombre",
      :descripcion => "value for descripcion"
    )
  end

  it "renders new mini_blog form" do
    render

    response.should have_tag("form[action=?][method=post]", mini_blogs_path) do
      with_tag("input#mini_blog_nombre[name=?]", "mini_blog[nombre]")
      with_tag("textarea#mini_blog_descripcion[name=?]", "mini_blog[descripcion]")
    end
  end
end
