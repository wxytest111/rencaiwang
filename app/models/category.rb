class Category < ActiveRecord::Base
  enum status: [:offline, :online, :on_menu]

  validates_presence_of :title

  has_many :articles

  has_many :children_categories, class_name: 'Category', foreign_key: 'parent_id'

  scope :parent_categories, -> { where('parent_id is null') }
  scope :child_categories, -> { where('parent_id is not null') }
end
