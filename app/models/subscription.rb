class Subscription < ActiveRecord::Base
  attr_accessible :category, :last_updated, :title, :url, :user_ids


  has_and_belongs_to_many :users
  has_many :articles
end
