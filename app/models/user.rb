class User < ActiveRecord::Base
  has_and_belongs_to_many :regions, :join_table => :user_regions
end
