$(document).on('turbolinks:load', function() {
  $('#friend-lookup').on('ajax:complete', function(event, data, status){
    $('#results').html(data.responseText)
  })
})
