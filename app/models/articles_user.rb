class ArticlesUser < ActiveRecord::Base

  attr_accessible :article_id, :is_bookmarked, :is_read, :is_favourite, :user_id

  belongs_to :article
  belongs_to :user

end