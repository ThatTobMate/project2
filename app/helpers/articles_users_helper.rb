module ArticlesUsersHelper
  def remove_bookmark
    @article_user = ArticlesUser.find(params[:id])
    @article_user.update_attributes(is_bookmarked:false)
    @article_user.save

    respond_to do |format|
      format.html { redirect_to articles_users_url }
      format.json { head :no_content }
    end
  end

end
