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
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .

$.widget( "ui.timespinner", $.ui.spinner, {
    options: {
        // seconds
        step: 60 * 1000,
        // hours
        page: 60
    },

    _parse: function( value ) {
        if ( typeof value === "string" ) {
            // already a timestamp
            if ( Number( value ) == value ) {
                return Number( value );
            }
            return +Globalize.parseDate( value );
        }
        return value;
    },

    _format: function( value ) {
        return Globalize.format( new Date(value), "t" );
    }
});

$(function() {
    $(".spinner").timespinner();
});

