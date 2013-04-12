$(document).ready(function() {
  $('.bid-button').click(function() {
    $('#new_bid_form').toggle();
  })


    
  $('#new_bid_form').on('ajax:success', function(event, data) {
    $('.bids').append(data);
  });
  // $('#new_bid').on('ajax:error', )
  
  var displayBid = function(event, data) {
    $("SOMETHING").html(data);
  }
});
