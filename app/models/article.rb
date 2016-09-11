class Article < ActiveRecord::Base
  enum status: [:offline, :online, :is_picture]
  belongs_to :region
  belongs_to :user
  belongs_to :category
end
