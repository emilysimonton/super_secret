$( document ).on( 'page:change', function () {
  var expiration = $('.countdown').data('expiration');
  $('.countdown').countdown({
    date: new Date(expiration),
    render: function(data) {
      $(this.el).html("<div>" + this.leadingZeros(data.days, 3) + " <span>days</span></div><div>" + this.leadingZeros(data.hours, 2) + " <span>hrs</span></div><div>" + this.leadingZeros(data.min, 2) + " <span>min</span></div><div>" + this.leadingZeros(data.sec, 2) + " <span>sec</span></div>");
    } 
  });
});
