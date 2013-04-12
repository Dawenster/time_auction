$(document).ready(function() {
  $('.bid-button').click(function() {
    $('#new_bid_form').toggleClass('hide');
    $(this).text() == 'Bid' ? $(this).text('Hide') : $(this).text('Bid');
  })
  
  $('#new_bid_form').on('ajax:success', function(event, data) {
    $('.bids tr:nth-child(2)').before(data);
    var hours = data.replace(/\D+/g, "");
    $('.highest-bid span').text(hours);
    $('.you-highest').removeClass('hide');
    $('#flash').text("");
  });
  
  $('#new_bid_form').on('ajax:error', function(event, data) {
    $('#flash').append(data.responseText);
  });
});
