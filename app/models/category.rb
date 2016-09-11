class Category < ActiveRecord::Base
  enum status: [:offline, :online, :on_menu]
  has_many :articles
end
