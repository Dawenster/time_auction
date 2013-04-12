$(document).ready(function() {
  $('.bid-button').click(function() {
    $('#new_bid_form').toggle();
  })
  
  $('#new_bid_form').on('ajax:success', function(event, data) {
    $('.bids tr:nth-child(2)').before(data);
  });
  
  $('#new_bid_form').on('ajax:error', function(event, data) {
    $('#flash').append(data.responseText);
  });
});
