$(document).ready(function() {
  $('.bid-button').click(function() {
    $('#new_bid_form').toggle();
  })
  
  $('#new_bid_form').on('ajax:success', function(event, data) {
    $('.bids tr:nth-child(2)').before(data);
  });
  
  $('#new_bid_form').on('ajax:fail', function(event, data) {
    debugger
    $('#flash').append(data.errors);
  });
  
  var displayBid = function(event, data) {
    $("SOMETHING").html(data);
  }
});
