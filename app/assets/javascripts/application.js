// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require sketch
//= require social-share-button
//= require_self
//= require_tree .

var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Storyline = {
  successHandler: function(data) {
    console.log("successfully created a new storyline");
    $("#new_storyline").hide();
    $("#player_form").append($("#player_fields").html());
  }
};

$(function() {

  console.log("in application");
  // dynamically add rows to the player form
  $("#add_player").click(function(e) {
    e.preventDefault();
    $("#storyline_form").append($("#players_form").html());
  });

  submitStoryline();
  submitPlayer();

  function submitStoryline() {
    $form = $("#new_storyline");

    console.log("here's storyline form: " + $form.length);

    $form.on("submit", function(event) {
      //$("#submit_storyline").on("click", function(event) {

      event.preventDefault();

      var storyName = $("#storyline_story_name").val(),
        name = $("#player_name").val(),
        email = $("#player_email").val(),
        turnNumber = $("#player_turn_number").val(),
        numPlayers = $("#storyline_num_players").val();

      $.ajax({
        url: "/storylines/create?players=true",
        type: "POST",
        data: {
          active: true,
          story_name: storyName,
          num_players: numPlayers
        },
        success: TelephonePictionary.Storyline.successHandler
      });
    });
  };

  function submitPlayer() {
    $form = $("#new_player");

    console.log("here's player form: " + $form.length);

    $form.on("submit", function(event) {
      event.preventDefault();
      var name = $("#player_name").val(),
        email = $("#player_email").val(),
        turnNumber = $("#player_turn_number").val();

      $.ajax({
        url: "/players/create/",
        type: "POST",
        data: {
          name: name,
          email: email,
          turn_number: turnNumber
        },
        success: TelephonePictionary.Storyline.successHandler
      });
    });
  };

});
