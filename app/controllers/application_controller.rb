class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :remove_bookmark
  helper_method :is_read_method

  before_filter :authenticate_user!, except: :index
  before_filter :get_subs
  before_filter :set_ransack_form_variables
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



  def set_ransack_form_variables
    q = params[:q]
      @feeds = Feed.search(title_cont: q).result
      @categories = Category.search(name_cont: q).result
      @articles = Article.search(title_cont: q).result 
  end
end
