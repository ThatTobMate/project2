class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_ransack_form_variables
    q = params[:q]
      @feeds = Feed.search(name_cont: q).result
      @categories = Category.search(name_cont: q).result
      @articles = Article.search(name_cont: q).result
  end

end
