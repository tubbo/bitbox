// Load JavaScript dependencies
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require bitbox

// Load the Foundation front-end framework onto the DOM
$(document).foundation();

// Instantiate our Ember.js app
Bitbox = Ember.Application.create();
