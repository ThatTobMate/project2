class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :url
      t.string :title
      t.string :category
      t.datetime :last_updated

      t.timestamps
    end
  end
end
