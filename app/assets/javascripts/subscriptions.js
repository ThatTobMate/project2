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

//POST /subscriptions (corresponds to create)
function createSubscription(){
  event.preventDefault();
  $this = $(this)
  subscriptionId = $this.data("id");
  request("POST", "/subscriptions", {
    subscription:{
      feed_id: subscriptionId, 
    }
  }).success(function(data){
    $this.replaceWith('<a href="/subscriptions/new" class="btn unsubscribe btn-danger" data-id="'+
      data.id +
      '">Unsubscribe</a>');
    loadSubscriptions();
  })
}

// DELETE /subscriptions/:id (corresponds to destroy)
function destroySubscription(event){
  event.preventDefault();
  $this = $(this)
  subscriptionId = $this.data("id");
  request("DELETE", "/subscriptions/"+subscriptionId, null).success(function(data){
    $this.replaceWith('<a class="btn btn-success subscribe" data-id="'+
      data.feed_id +
      '">Subscribe</a>');
      loadSubscriptions();
  })
}

$(function(){
  $('body').on('click','.subscribe', createSubscription);
  $('body').on('click','.unsubscribe', destroySubscription);
  loadSubscriptions();
})

