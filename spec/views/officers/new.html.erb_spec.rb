require 'rails_helper'

RSpec.describe "officers/new", type: :view do
  before(:each) do
    assign(:officer, Officer.new(
      name: "MyString"
    ))
  end

  it "renders new officer form" do
    render

    assert_select "form[action=?][method=?]", officers_path, "post" do

      assert_select "input[name=?]", "officer[name]"
    end
  end
end
