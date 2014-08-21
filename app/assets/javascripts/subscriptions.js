function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data
  })
}

// get subscriptions

function loadSubscriptions(){
  $("#subslist").html("");
  $.getJSON("/subscriptions", function(data){
    $.each(data, function(i, cat){
      var catrow = $("<p class='category'>"+ i +"</p>");
      catrow.appendTo('#subslist');
      $.each(cat, function(j, subs){
        subsrow = $('<li data-subslist="'+
        subs.id +
        '"><a href="/feeds/' +
        subs.feed_id +
        '">'+
        subs.feed.title +
        '</a>'+
        '</li>');
        subsrow.appendTo('#subslist');
      })
    })
  })
}
// add a <li> to the list #sidebar subscriptions
function appendNewSubscription(data){
  $('<li>' +
  '<a href="/feeds/' +
  data.feed_id +
  '">'+
  data.feed_title +
  '</a>'+
  '</li>').appendTo("#category")
}

//POST /subscriptions (corresponds to create)
function createSubscription(){
  event.preventDefault();
  $this = $(this)
  subscriptionId = $this.data("id");
  // subscriptionTitle = $this.data("name");
  request("POST", "/subscriptions", {
    subscription:{
      feed_id: subscriptionId, 
    }
  }).success(function(){
    debugger
    $this.removeClass("subscribe");
    $this.removeClass("btn-success");
    $this.addClass("unsubscribe");
    $this.addClass("btn-danger");
    $this.text("Unsubscribe");
    loadSubscriptions();
  })
}

// DELETE /subscriptions/:id (corresponds to destroy)
function destroySubscription(event){
  event.preventDefault();
  $this = $(this)
  subscriptionId = $this.data("id");
  request("DELETE", "/subscriptions/"+subscriptionId, null).success(function(data){

      $this.removeClass("unsubscribe");
      $this.removeClass("btn-danger");
      $this.addClass("btn-success");
      $this.addClass("subscribe");
      $this.text("Subscribe");
      loadSubscriptions();
  })
}

$(function(){
  $('.subscribe').on('click', createSubscription);
  $('.unsubscribe').on('click', destroySubscription);
  loadSubscriptions();
})

