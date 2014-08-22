function request(method, url, data){

  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data
  })
}



function loadBookmarks(){
  $("#bookmarklets").html("Bookmarks");

  $.getJSON("/articles_users", function(data){
  
    $.each(data, function(i, cat){
      var catrow = $('<li><a href="/articles_users/'+ cat.id + '">' + cat.article.title + '</a>' + '</li>');
      catrow.appendTo('#bookmarklets');
    });
  })

  }

//POST /Bookmarks (corresponds to create)
function createBookmark(event){
  event.preventDefault();
  $this = $(this)
  articleId = $this.data("id");
  request("POST", "/articles_users", {
    article_user:{
      article_id:articleId
    }
  }).success(function(data){
    $this.replaceWith('<a href="#" class="btn btn-warning unbookmark" data-id="' + data.id + '">remove</a>');

  })
}


// DELETE /Bookmarks/:id (corresponds to destroy)
function changeBookmark(){
  console.log('warning')
  $this = $(this)
  articleuserId = $this.data("id");
  request("PUT", "/articles_users/"+articleuserId, { articles_user:
     {is_bookmarked: false}
   }).success(function(){
   $this.replaceWith('<a href="/articles_users/new" class="btn btn-info bookmark" data-id="' + articleuserId + '" role="button">Bookmark</a>');

})
}




$(function(){
  $('body').on('click', '.bookmark', createBookmark);
  $('body').on('click', '.unbookmark', changeBookmark);
  loadBookmarks();
})