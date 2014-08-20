function request(method, url, data){

  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}

// add a <li> to the list #todo-list
function appendNewSubscription(data){
  // $('<li class="'+ (data.done == true ? "completed" : "") + '">'+
  //     '<input class="toggle" type="checkbox" data-id="'+ data.id +'" '+ (data.done == true ? 'checked="checked"' : "") + '>'+
  //     '<label>'+ data.title +'</label>'+
  //     '<button class="destroy" data-id="'+ data.id +'"></button>'+
  //   '</li>').prependTo("#entries")
}

//POST /subscriptions (corresponds to create)
function createSubscription(){
  event.preventDefault();
  $this = $(this)
  subscriptionId = $this.data("id");
  request("POST", "/subscriptions", {
    subscription:{
      feed_id:subscriptionId
    }
  }).success(function(data){
    $('#entries').val("");
    appendNewSubscription(data)
  })
}

// DELETE /subscriptions/:id (corresponds to destroy)
function destroySubscription(){
  $this = $(this)
  subscriptionId = $this.data("id");
  request("DELETE", "/subscriptions/"+subscriptionId, null).success(function(data){
      $this.parent().remove()
  })
}


$(function(){
  $('.subscribe').on('click', createSubscription);
  $('#todo-list').on('click', ".destroy", destroySubscription);
})