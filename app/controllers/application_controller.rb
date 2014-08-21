class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :authenticate_user!, except: [:index, :sign_up]
  before_filter :set_ransack_form_variables

  helper_method :remove_bookmark
  helper_method :is_read_method

  def set_ransack_form_variables
    q = params[:q]
      @feeds = Feed.search(title_cont: q).result
      @categories = Category.search(name_cont: q).result
      @articles = Article.search(title_cont: q).result 
  end
end
