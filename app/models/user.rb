class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable, confirm_within: 10.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :feed_ids
  # attr_accessible :title, :body

  has_many :subscriptions
  has_many :feeds, through: :subscriptions
  has_many :articles, through: :feeds
  has_many :articles_users
end
