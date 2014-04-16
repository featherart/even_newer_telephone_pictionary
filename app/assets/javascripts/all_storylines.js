$(function() {
  var playButton = $("#play_button");

  playButton.on("click", function() {
    location.href = "/";
  });

  // handle show storyline without opening a new window
  //$("li").on("click", function(e) { alert("click " + this.id); });
})