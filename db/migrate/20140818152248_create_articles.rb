class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.string :url
      t.string :entry_id
      t.datetime :published
      t.text :image
      t.integer :feed_id

      t.timestamps
    end
  end
end
