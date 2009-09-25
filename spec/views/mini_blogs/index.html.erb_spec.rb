require 'spec/spec_helper'

describe "/mini_blogs/index.html.erb" do
  include MiniBlogsHelper

  before(:each) do
    assigns[:mini_blogs] = [
      stub_model(MiniBlog,
        :nombre => "value for nombre",
        :descripcion => "value for descripcion"
      ),
      stub_model(MiniBlog,
        :nombre => "value for nombre",
        :descripcion => "value for descripcion"
      )
    ]
  end

  it "renders a list of mini_blogs" do
    render
    response.should have_tag("tr>td", "value for nombre".to_s, 2)
    response.should have_tag("tr>td", "value for descripcion".to_s, 2)
  end
end
