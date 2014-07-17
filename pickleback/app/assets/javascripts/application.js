// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require grid
//= require bootstrap.js
//= require jquery.countdown.js
//= require jquery.superslides.min.js
//= require jquery.backtotop.js
//= require jquery.parallax.js
//= require jquery.backgroundvideo.js
//= require venobox.min.js
//= require waypoints.js
//= require jquery.countTo.js
//= require jquery.smooth-scroll.min.js
//= require jquery.fitvid.js
//= require jquery.sudoslider.min.js
//= require jquery_ujs
//= require main.js
//= require turbolinks
//= require jquery.turbolinks
//= require jquery.plugin.js
//= require modernizr.custom.js
//= require_tree .


$(function() {
    $('.add-recipient-email').click(function() {
        $('.recipient-email:first').after($('.recipient-email:first').clone());
    });

    $(document).on('click', 'input[type=text]', function() {
        this.select();
    });
});
