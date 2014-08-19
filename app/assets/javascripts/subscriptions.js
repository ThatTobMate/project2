function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}

// add a <li> to the list #todo-list
function appendNewTask(data){
  $('<li class="'+ (data.done == true ? "completed" : "") + '">'+
      '<input class="toggle" type="checkbox" data-id="'+ data.id +'" '+ (data.done == true ? 'checked="checked"' : "") + '>'+
      '<label>'+ data.title +'</label>'+
      '<button class="destroy" data-id="'+ data.id +'"></button>'+
    '</li>').prependTo("#entries")
}

//POST /subscriptions (corresponds to create)
function createTask(){
  event.preventDefault();
  var userid = 116;
  var feedid = 24;
  request("POST", "/subscriptions", {
    subscription:{
      feed_id: feedid,
      user_id: userid
    }
  }).success(function(data){
    $('#entries').val("")
    alert('warning');
    console.log(data)
    appendNewTask(data)
  })
}

// DELETE /subscriptions/:id (corresponds to destroy)
function destroyTask(){
  $this = $(this)
  taskId = $this.data("id");
  request("DELETE", "/subscriptions/"+taskId, null).success(function(data){
      $this.parent().remove()
  })
}

// PUT /subscriptions/:id (only column done) (corresponds to update)
function changeTaskStatus(){
  $this = $(this)
  taskId = $this.data("id");
  isDone = $this.is(":checked")
  request("PUT", "/subscriptions/"+taskId, {task:{done: isDone}}).success(function(){
    $this.parent().toggleClass("completed")
  })
}

// GET /subscriptions (corresponds to index)
function getTasks(){
  request("GET", "/subscriptions", null).success(function(data){
      $.each(data, function(i, task){
        appendNewTask(task)
      })
  })
}

$(function(){
  $('.subscribe a').on('click', createTask);
  $('#todo-list').on('click', ".destroy", destroyTask);
  $("#todo-list").on("change", ".toggle" , changeTaskStatus);
  getTasks()
})