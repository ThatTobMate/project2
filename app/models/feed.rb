class Feed < ActiveRecord::Base
  attr_accessible :category, :last_updated, :title, :url, :user_ids


  has_many :subscriptions
  has_many :articles
end
