require 'spec/spec_helper'

describe "/mini_blogs/show.html.erb" do
  include MiniBlogsHelper
  before(:each) do
    assigns[:mini_blog] = @mini_blog = stub_model(MiniBlog,
      :nombre => "value for nombre",
      :descripcion => "value for descripcion"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nombre/)
    response.should have_text(/value\ for\ descripcion/)
  end
end
