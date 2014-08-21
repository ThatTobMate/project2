module SubscriptionsHelper
  def is_user_subscribed?(feed)
    feed.subscriptions.map{|subs| subs.user_id}.include?(current_user.id)
  end

  def get_subscription_id(feed)
    feed.subscriptions.where(user_id: current_user.id).first.id
    
  end
end
