class Article < ActiveRecord::Base
  enum status: [:offline, :online]
  belongs_to :region
  belongs_to :user
  belongs_to :category

  before_save :get_cover_url_and_summary

  def get_cover_url_and_summary
    nokog_html = Nokogiri::HTML(self.content)
    if nokog_html.css('img').length>0
      self.cover_url = nokog_html.css('img').first.attr('src')
    end
    self.summary = nokog_html.text.gsub(/(\r|\n|\s)+/,'')[0,200]
  end
end
