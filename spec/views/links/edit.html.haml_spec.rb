require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :name => "MyString",
      :url => "MyString",
      :priority => 1,
      :status => 1
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_name[name=?]", "link[name]"

      assert_select "input#link_url[name=?]", "link[url]"

      assert_select "input#link_priority[name=?]", "link[priority]"

      assert_select "input#link_status[name=?]", "link[status]"
    end
  end
end
