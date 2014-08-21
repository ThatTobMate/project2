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
        subsrow = $('<li><a href="/feeds/' +
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
  subscriptionTitle = $this.data("name");
  request("POST", "/subscriptions", {
    subscription:{
      feed_id: subscriptionId, 
    }
  }).success(function(){
    loadSubscriptions()
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
function showPages() {
  $(".blockview").toggleClass("hide-elements")
  $(".listview").toggleClass("hide-elements")
}

$(function(){
  $('.subscribe').on('click', createSubscription);
  $('#todo-list').on('click', ".destroy", destroySubscription);
  $('#show-pages').on('click', showPages);
  loadSubscriptions();
})

