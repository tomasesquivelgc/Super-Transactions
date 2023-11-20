require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    assign(:category, Category.create!(
      name: "Name",
      image: "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Image/)
  end
end
