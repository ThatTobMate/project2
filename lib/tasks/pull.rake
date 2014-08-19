namespace :rss do
  desc "This Task will pull data from all the feeds and update their content"
  task :pull_feeds => :environment do
    Feed.all.each { |a| Article.update_from_feed(a.url,a.id)} 
  end
end
