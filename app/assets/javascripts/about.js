$(document).ready(function() {
  $('#the-team').click(function(e) {
    e.preventDefault();
    $('body').animate({scrollTop: $('#team-intro').offset().top}, 500);
  });
});