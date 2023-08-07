require 'rails_helper'

RSpec.describe "officers/index", type: :view do
  before(:each) do
    assign(:officers, [
      Officer.create!(
        name: "Name"
      ),
      Officer.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of officers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
