class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :feeds
  has_many :subscriptions
end
