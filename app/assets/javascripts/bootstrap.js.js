// Generated by CoffeeScript 1.6.3
jQuery(function() {
  $("a[rel=popover]").popover();
  $(".tooltip").tooltip();
  $("a[rel=tooltip]").tooltip();
  $("i").tooltip({
    placement: "bottom",
    delay: {
      show: 200,
      hide: 100
    }
  });
  return $('.best_in_place').best_in_place();
});
