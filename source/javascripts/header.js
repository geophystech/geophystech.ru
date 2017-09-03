// Drop shadow on scroll.
$(window).scroll(function() {
  var $navbar = $('.navbar');
  var $distance = $(this).scrollTop();

  if ($distance > 70) {
      $navbar.addClass('navbar-with-shadow');
  } else {
    if ($navbar.hasClass('navbar-with-shadow')) $navbar.removeClass('navbar-with-shadow');
  }
});
