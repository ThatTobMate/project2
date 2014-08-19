class CreateArticlesUsers < ActiveRecord::Migration
  def change
    create_table :articles_users do |t|
        t.integer :user_id
        t.integer :article_id
        t.boolean :is_read
        t.boolean :is_bookmarked
        t.boolean :is_favourite

        t.timestamps
      end
    end
end
