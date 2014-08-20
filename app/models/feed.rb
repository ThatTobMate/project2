class Feed < ActiveRecord::Base
  attr_accessible :category_id, :last_updated, :title, :url, :user_ids, :image, :description


  has_many :subscriptions, dependent: :destroy
  has_many :articles,  dependent: :destroy
  belongs_to :category
end
