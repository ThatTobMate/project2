class Feed < ActiveRecord::Base
  attr_accessible :category_id, :last_updated, :title, :url, :user_ids, :image, :description


  has_many :subscriptions
  has_many :articles
  belongs_to :category
end
