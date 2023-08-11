require 'rails_helper'

RSpec.describe "ranks/show", type: :view do
  before(:each) do
    @rank = assign(:rank, Rank.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
