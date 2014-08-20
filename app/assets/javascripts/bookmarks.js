function request(method, url, data){

  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}

// add a <li> to the list #todo-list
function appendNewBookmark(data){
  // $('<li class="'+ (data.done == true ? "completed" : "") + '">'+
  //     '<input class="toggle" type="checkbox" data-id="'+ data.id +'" '+ (data.done == true ? 'checked="checked"' : "") + '>'+
  //     '<label>'+ data.title +'</label>'+
  //     '<button class="destroy" data-id="'+ data.id +'"></button>'+
  //   '</li>').prependTo("#entries")
}

//POST /Bookmarks (corresponds to create)
function createBookmark(){
  event.preventDefault();
  $this = $(this)
  bookmarkId = $this.data("id");
  request("POST", "/bookmarks", {
    bookmark:{
      feed_id:bookmarkId
    }
  }).success(function(data){
    $('#entries').val("");
    alert('warning');
    console.log(data)
    appendNewBookmark(data)
  })
}

// DELETE /Bookmarks/:id (corresponds to destroy)
function destroyBookmark(){
  $this = $(this)
  bookmarkId = $this.data("id");
  request("DELETE", "/bookmarks/"+bookmarkId, null).success(function(data){
      $this.parent().remove()
  })
}


$(function(){
  $('.bookmark a').on('click', createBookmark);
  $('#todo-list').on('click', ".destroy", destroyBookmark);
})