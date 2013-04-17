$(document).ready(function() {
  $('#learn-more').click(function(e) {
    e.preventDefault();
    $('body').animate({scrollTop: $('#intro').offset().top}, 500);
  });
});