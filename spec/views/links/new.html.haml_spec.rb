require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      :name => "MyString",
      :url => "MyString",
      :priority => 1,
      :status => 1
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input#link_name[name=?]", "link[name]"

      assert_select "input#link_url[name=?]", "link[url]"

      assert_select "input#link_priority[name=?]", "link[priority]"

      assert_select "input#link_status[name=?]", "link[status]"
    end
  end
end
