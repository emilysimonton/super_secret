$( document ).on( 'page:change', function () {
  var expiration = $('#countdownClock').data('expiration');
  $('#countdownClock').countdown({until: new Date(expiration)});
});
