require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :title => "MyString",
      :source => "MyString",
      :content => "MyText",
      :region => nil,
      :user => nil,
      :category => nil
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_source[name=?]", "article[source]"

      assert_select "textarea#article_content[name=?]", "article[content]"

      assert_select "input#article_region_id[name=?]", "article[region_id]"

      assert_select "input#article_user_id[name=?]", "article[user_id]"

      assert_select "input#article_category_id[name=?]", "article[category_id]"
    end
  end
end
