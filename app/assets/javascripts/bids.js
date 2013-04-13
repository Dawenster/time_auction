$(document).ready(function() {
  $('.bid-button').click(function() {
    $('#new_bid_form').toggleClass('hide');
    $(this).text() == 'Bid' ? $(this).text('Hide') : $(this).text('Bid');
  })
  
  $('#new_bid_form').on('ajax:success', function(event, data) {
    $('.bids tr:first-child').after(data);
    var hours = data.replace(/\D+/g, "");
    $('.you-highest').removeClass('hide');
    $('.highest-bid span').text(hours);
    $('#flash').text("");
    $('.no-bids-yet').text("");
  });
  
  $('#new_bid_form').on('ajax:error', function(event, data) {
    $('#flash').text("");
    $('#flash').append(data.responseText);
  });
});
