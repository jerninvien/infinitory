$(document).ready ->
  text_max = 300
  $("#comment_feedback").html "* " + text_max + " characters remaining"
  $("#comment").keyup ->
    text_length = $("#comment").val().length
    text_remaining = text_max - text_length
    $("#comment_feedback").html "* " + text_remaining + " characters remaining"

    $('#comment_feedback').addClass("overlimit") &&
    $('#feedback_submit').attr("disabled", true) if text_remaining < 0

    $('#comment_feedback').removeClass("overlimit") &&
    $('#feedback_submit').attr("disabled", false) if text_remaining  >= 0
