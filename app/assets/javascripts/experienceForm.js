$(function () {
  var ENTER = 13;
  var startNewLine = function () {
    $(this).val($(this).val() + "- ");
  };

  $("#experience_current").on("change", function () {
    $("#end_date").toggleClass("hide");
    $("#end_date").find("select").prop("selectedIndex", 0);
  });

  $("textarea").on("focus", function () {
    if (!$(this).val()) {
      startNewLine.call(this);
    }
  });

  $("textarea").on("keyup", function (e) {
    if (e.which === ENTER) {
      startNewLine.call(this);
    }
  });
});
