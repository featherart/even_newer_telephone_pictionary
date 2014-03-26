var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Storyline = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a storyline");
    $("#new_storyline").hide();
  }
};

$(function() {
  console.log("in storyline");

  submitStoryline();
  //submitPlayer();

  function submitStoryline () {
    $form = $("#new_storyline");
    console.log("here's storyline form: " + $form.length);
    $form.on("submit", function(event) {
      event.preventDefault();
      var story_name = $("#storyline_story_name"),
        name = $("#player_name").val(),
      //phone = $("#player_phone_number").val(),
        email = $("#player_email").val();
      turn = $("#player_turn_number").val();

      console.log("in storylines, post: " + name + ' ' + email + " " + story_name);
      $.ajax({
        url: "/storylines/create/",
        type: "POST",
        data: {
          active: true,
          story_name: story_name,
          name: name,
          email: email,
          turn_number: turn
        },
        success: TelephonePictionary.Storyline.successHandler
      });
    });
  };

  // not using this now
  function submitPlayer () {
    $form = $("#new_storyline");
    $form.on("submit", function(event) {
      event.preventDefault();
      var name = $("#player_name").val();
      var phone = $("#player_phone_number").val();
      var turn = $("#player_turn_number").val();
      $.ajax({
        url: "/players/create",
        type: "POST",
        data: {
          name: name,
          phone_number: phone,
          turn_number: turn
        },
        success: TelephonePictionary.Storyline.successHandler,
        error: function( data ) {
          console.log("error submitting player");
        }
      });
    });
  };

});
