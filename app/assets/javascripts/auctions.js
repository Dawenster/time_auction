$(document).ready(function() {
  $("#auction_start_date").datepicker();
  $("#auction_end_date").datepicker();
  if ($('#verified_time').any?) {
    $('#verified_time').removeClass('hide');
  }
});
