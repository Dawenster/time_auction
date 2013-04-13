$(document).ready(function() {
  $("#auction_start_date").datepicker();
  $("#auction_end_date").datepicker();
  var myRe = /edit/i;
  if ( myRe.test(window.location)) {
    $('#verified_time').removeClass('hide');
  }
});
