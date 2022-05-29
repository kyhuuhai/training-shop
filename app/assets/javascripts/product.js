$(document).ready(function () {
  starImg = $(".slide img:first").attr("stt");
  endImg = $(".slide img:last").attr("stt");
  var stt = starImg;
  $(".slide img").each(function () {
    if ($(this).is(":visible")) stt = $(this).attr("stt");
  });
  $(".clickR").click(function () {
    if (stt == endImg) {
      stt = starImg - 1;
    }
    clickR = ++stt;
    $(".slide img").hide();
    $(".slide img").eq(clickR).show();
  });
  $(".clickL").click(function () {
    if (stt == starImg) {
      stt = endImg;
      clickL = stt++;
    }
    clickL = --stt;
    $(".slide img").hide();
    $(".slide img").eq(clickL).show();
  });
  //lap lai vo han
  setInterval(function () {
    $(".clickR").click();
  }, 4000);
});
