$(document).ready(function() {

  $('.commit-to-bid').click(function(e){
    e.preventDefault();
    var commitment_time = $('#bid_time').val();
    $("#new_bid_form").submit();
    $('.commit-to-bid').button();
    $('.nav-tabs').button()
    $('.commit-to-bid').button('loading');
  });

  $('#new_bid_form').on('ajax:success', function(event, data) {

    var hours = data.match(/>\d+</)[0].replace(/</,"").replace(/>/,"")
    var name = data.match(/<a href="\/users\/\d+">(\w+|\w+\s+|\w+\s+\w+|\w+\s+\w+\s+\w+|\w+\s+\w+\s+\w+\s+\w+)<\/a>/)[0].split(',')[0]

    if (hours >= 100) {
      $('#bid_success_popup .errors').text('PLEASE NOTE: Due to the generous ' +
       'size of this bid, an admin may follow up with you.');
    }
    $('#new_bid_form').fadeOut(50);
    $('#bid_success_popup').fadeIn(50);
    $('.bids tr:first-child').after(data);
    $('.you-highest').removeClass('hide');
    $('#hours').text(hours);
    $('.highest-bidder').html('By: ' + name);
    $('#flash').text("");
    $('#flash').removeClass("alert alert-errors");
    $('.no-bids-yet').text("Highest Bid");
    $('.commit-to-bid').button("reset");
    $('#bid_time').val("");
  });
  
  $('#new_bid_form').on('ajax:error', function(event, data) {
    $('#spinner').fadeOut(50);
    $('#overlay').fadeOut(50);
    $('#new_bid_form').fadeOut(50);
    $('#flash').text("");
    $('#flash').addClass("alert alert-errors");
    $('#flash').append(data.responseText);
    $('.commit-to-bid').button("reset");
    $('#bid_time').val("");
  });

  $('#trigger').click(function(){
    if ( $(document).scrollTop() < 52 || $(document).scrollTop() > 132) {
      $('body').animate({scrollTop:90}, 500);
    }
    $('#new_bid_form').fadeIn(50);
    $('#overlay').fadeIn(50);
  });
  
  $('#overlay').click(function(){
      $('#new_bid_form, #bid_success_popup, #spinner').fadeOut(50);
      $('#overlay').fadeOut(50);
  });

  $('#success_popup_close').click(function(){
    $('#bid_success_popup').fadeOut(50);
    $('#overlay').fadeOut(50);
  });

  $('#bid_charity_id').tooltip({
    'placement': "top"
  })

  $('#bid_charity_id').click(function() {
    $.ajax({
      url: '/charities',
      method: 'get',
      dataType: 'json'
    })
    .done(function(data) {
      var charities = []
      for (i = 0; i < data.length; i++ ) {
        charities.push(data[i].name);
      }
      $("#bid_charity_id").autocomplete({
        source: charities
      });
    })
  });
});
