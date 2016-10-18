class Article < ActiveRecord::Base
  enum status: [:offline, :online]
  belongs_to :region
  belongs_to :user
  belongs_to :category

  before_save :get_cover_url

  def get_cover_url
    nokog_html = Nokogiri::HTML(self.content)
    if nokog_html.css('img').length>0
      self.cover_url = nokog_html.css('img').first.attr('src')
    end
  end
end
