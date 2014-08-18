class Article < ActiveRecord::Base
  attr_accessible :entry_id, :image, :published, :summary, :title, :url
end
