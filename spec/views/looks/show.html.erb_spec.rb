require 'rails_helper'

RSpec.describe "looks/show", type: :view do
  before(:each) do
    @look = assign(:look, Look.create!(
      :name => "Name",
      :price => 2,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
  end
end
