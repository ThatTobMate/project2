class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, except: :index
  before_filter :get_subs
  # GET /subscriptions
  # GET /subscriptions.json
  def get_subs

if current_user
    @subscriptions = Subscription.where(user_id: current_user.id)
    @subscriptions_list = @subscriptions.group_by { |t| t.category.name }

else  
    @subscriptions = []
    @subscriptions_list = []

  end
    
  end
end
