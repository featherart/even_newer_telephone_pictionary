var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Player = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a player");
    $("#new_player").hide();
    //$("#new_drawings").append("<h4><small>Your picture is below! Please log out now.</small></h4><br /><img src='"+$("#picture_image").val() +"' />");
  }
};

$(function() {
    console.log("in player");
    //submitPlayer();

    function submitPlayer () {
      $form = $("#new_player");
      console.log("in player form: " + $form.length);
      $form.on("submit", function(event) {
          event.preventDefault();
          var name = $("#player_name").val();
          var phone = $("#player_phone_number").val();
          var turn = $("#player_turn_number").val();
      $.ajax({
         url: "/players",
         type: "POST",
         data: {
           name: name,
           phone_number: phone,
           turn_number: turn
         },
         success: function( data ) {
           console.log("success");
           $form.hide();       
         },
         error: function( data ) {
          console.log("ooops");
         }
       });    
      });
    };
 });
