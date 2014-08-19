class Article < ActiveRecord::Base
  attr_accessible :entry_id, :image, :published, :summary, :title, :url, :feed_id

  def self.update_from_feed(feed_url,id)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    @feed_id = id
    add_entries(feed.entries)
  end
  
  # def self.update_from_feed_continuously(feed_url, delay_interval = 2.minutes)
  #   feed = Feedjira::Feed.fetch_and_parse(feed_url)
  #   add_entries(feed.entries)
  #   loop do
  #     sleep delay_interval
  #     feed = Feedjira::Feed.update(feed)
  #     add_entries(feed.new_entries) if feed.updated?
  #   end
  # end
  
  private
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :entry_id => entry.id
        create!(
          :title         => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published => entry.published,
          :entry_id         => entry.id,
          :image  =>  entry.image,
          :feed_id  => @feed_id
        )
      end
    end
  end


  belongs_to :feed
  has_many :articles_users
end
