class RemoveCategoryFromFeeds < ActiveRecord::Migration
  def change
    remove_column :feeds, :category
  end
end
