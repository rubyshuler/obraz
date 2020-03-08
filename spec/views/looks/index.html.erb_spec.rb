require 'rails_helper'

RSpec.describe "looks/index", type: :view do
  before(:each) do
    assign(:looks, [
      Look.create!(
        :name => "Name",
        :price => 2,
        :description => "Description"
      ),
      Look.create!(
        :name => "Name",
        :price => 2,
        :description => "Description"
      )
    ])
  end

  it "renders a list of looks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
