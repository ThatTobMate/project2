class Subscription < ActiveRecord::Base
  attr_accessible :category, :last_updated, :title, :url
end
