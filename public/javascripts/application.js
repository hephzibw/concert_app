// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
       $(document).ready(function() {
  setTimeout(hideFlashes, 25000);
});

var hideFlashes = function() {
  $('.success').fadeOut(1500);
};