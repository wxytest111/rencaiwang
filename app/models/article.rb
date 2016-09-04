class Article < ActiveRecord::Base
  belongs_to :region
  belongs_to :user
  belongs_to :category
end
