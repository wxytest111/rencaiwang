class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_and_belongs_to_many :regions, :join_table => :user_regions

  validates :email,
            # format:     { with: /\A1[3578]\d{9}\Z/, message: '手机号码格式不正确', multiline: true },
            presence:   { presence: true, message: '请填写手机号' },
            uniqueness: { message: '已经被注册' }

  has_many :articles
end
