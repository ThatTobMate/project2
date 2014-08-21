class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :authenticate_user!, except: :index
  before_filter :set_ransack_form_variables

  def set_ransack_form_variables
    q = params[:q]
      @feeds = Feed.search(title_cont: q).result
      @categories = Category.search(name_cont: q).result
      @articles = Article.search(title_cont: q).result 
  end
end
