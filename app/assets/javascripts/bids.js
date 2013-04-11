$(document).ready(function() {
  $('#new_bid').on('ajax:success', displayBid() )
  $('#new_bid').on('ajax:error', )
  
  var displayBid = function(event, data) {
    $("SOMETHING").html(data);
  }
});
