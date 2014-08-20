class Subscription < ActiveRecord::Base
  attr_accessible :feed_id, :user_id, :category_id

  belongs_to :user
  belongs_to :feed
  belongs_to :category
end
