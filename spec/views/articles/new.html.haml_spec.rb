require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "MyString",
      :source => "MyString",
      :content => "MyText",
      :region => nil,
      :user => nil,
      :category => nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_source[name=?]", "article[source]"

      assert_select "textarea#article_content[name=?]", "article[content]"

      assert_select "input#article_region_id[name=?]", "article[region_id]"

      assert_select "input#article_user_id[name=?]", "article[user_id]"

      assert_select "input#article_category_id[name=?]", "article[category_id]"
    end
  end
end
