require 'rails_helper'

RSpec.describe "designers/index", type: :view do
  before(:each) do
    assign(:designers, [
      Designer.create!(),
      Designer.create!()
    ])
  end

  it "renders a list of designers" do
    render
  end
end
