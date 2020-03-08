require 'rails_helper'

RSpec.describe "looks/new", type: :view do
  before(:each) do
    assign(:look, Look.new(
      :name => "MyString",
      :price => 1,
      :description => "MyString"
    ))
  end

  it "renders new look form" do
    render

    assert_select "form[action=?][method=?]", looks_path, "post" do

      assert_select "input[name=?]", "look[name]"

      assert_select "input[name=?]", "look[price]"

      assert_select "input[name=?]", "look[description]"
    end
  end
end
