require 'rails_helper'

RSpec.describe "ranks/index", type: :view do
  before(:each) do
    assign(:ranks, [
      Rank.create!(
        name: "Name"
      ),
      Rank.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of ranks" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
