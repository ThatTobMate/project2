class AddSubscriptionIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :subscription_id, :integer
  end
end
