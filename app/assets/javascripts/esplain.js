$(function() {
  var playButton = $("#play_button"),
      storyButton = $("#story_button");

  playButton.on("click", function() {
    location.href = "/";
  });
  storyButton.on("click", function() {
    location.href = "/?list=true";
  });
});