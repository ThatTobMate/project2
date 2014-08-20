class ArticlesUsersController < ApplicationController

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @article_users = ArticlesUser.all


  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    @article_user = ArticlesUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.json
  def new
    @bookmark = ArticlesUser.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = ArticlesUser.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    # @bookmark = ArticlesUser.new(params[:id])
    @article_user =ArticlesUser.new(user_id:current_user.id,article_id:params[:article_user][:article_id],is_bookmarked:true)


    respond_to do |format|
      if @article_user.save
        format.html { redirect_to @article_user, notice: 'article_user was successfully created.' }
        format.json { render json: @article_user, status: :created, location: @article_user }
      else
        format.html { render action: "new" }
        format.json { render json: @article_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.json
  def update
    @bookmark = ArticlesUser.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @article_user = ArticlesUser.find(params[:id])
    @article_user.destroy

    respond_to do |format|
      format.html { redirect_to articles_users_url }
      format.json { head :no_content }
    end
  end
end

