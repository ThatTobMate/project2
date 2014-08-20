# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Feed.delete_all
Category.delete_all
Subscription.delete_all

c1 = Category.create!(name: "News")
c2 = Category.create!(name: "Sport")

f1 = Feed.create!(url:"http://feeds.bbci.co.uk/news/world/rss.xml",title:"bbc", category_id: c1.id)
f2 = Feed.create!(url:"http://www.utah.gov/whatsnew/rss.xml",title:"utahnews", category_id: c1.id)

u1 = User.create!(email:"madeupname@gmail.com",password:"12341234",feed_ids:[f1.id])
u2 = User.create!(email: "user@user.com", password: "password",feed_ids:[f1.id,f2.id])
u3 = User.create!(email: "admin@admin.com", password: "password",feed_ids:[f2.id])

Subscription.all.each do |subs|
  category = subs.feed.category_id
  subs.category_id = category
  subs.save
end



