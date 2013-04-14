$(document).ready(function() {
  $("#auction_start_date").datepicker();
  $("#auction_end_date").datepicker();
  var myRe = /auctions\/\d+\/edit/i;
  if ( myRe.test(window.location)) {
    $('#verified_time').removeClass('hide');
    $('.btn').val('Edit Auction');
  }
});
