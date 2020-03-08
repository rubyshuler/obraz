require 'rails_helper'

RSpec.describe "looks/edit", type: :view do
  before(:each) do
    @look = assign(:look, Look.create!(
      :name => "MyString",
      :price => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit look form" do
    render

    assert_select "form[action=?][method=?]", look_path(@look), "post" do

      assert_select "input[name=?]", "look[name]"

      assert_select "input[name=?]", "look[price]"

      assert_select "input[name=?]", "look[description]"
    end
  end
end
