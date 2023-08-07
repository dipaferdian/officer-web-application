require 'rails_helper'

RSpec.describe "officers/show", type: :view do
  before(:each) do
    @officer = assign(:officer, Officer.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
