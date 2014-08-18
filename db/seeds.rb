# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Subscription.delete_all


s1 = Subscription.create!(url:"http://feeds.bbci.co.uk/news/world/rss.xml",title:"bbc",category:"news")
s2 = Subscription.create!(url:"http://www.utah.gov/whatsnew/rss.xml",title:"utahnews",category:"news")

u1 = User.create!(email:"madeupname@gmail.com",password:"12341234",subscription_ids:[s1.id])
u2 = User.create!(email: "user@user.com", password: "password",subscription_ids:[s1.id,s2.id])
u3 = User.create!(email: "admin@admin.com", password: "password",subscription_ids:[s2.id])



