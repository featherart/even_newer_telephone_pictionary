var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Picture = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a picture");
    $("#new_picture").hide();
    $("#color_drawing").hide();
    $("#phrases").hide();
    $("#picture_instructions").hide();
    $("#new_drawings").append("<h4><small>Your picture is below</small> </h4><br /><img src='"+$("#picture_image").val() +"' />");
    $("footer").append("<h4><small>You are the next Picasso! </small> </h4>");   
    $("footer").append('<button class="btn btn-default"><a href="/">next play</a></button><br>');
    $("footer").append("<span class='glyphicon glyphicon-send'></span> <a href='http://telephone-pictionary.herokuapp.com/'>share this url</a> to play with a friend.");

  }
};

$(function() {
 
  var $canvas = $("#drawing"),
      $form = $("#new_picture"),
      $hidden = $("#picture_image"),
      $clear = $("#clear");

  if( $canvas[0] !== undefined ) {
      var context = $canvas[0].getContext('2d');
  }
  function clearCanvas() {
    context.clearRect(0,0,$canvas.width(),$canvas.height()); 
  }

  $('#clear').click(function() {
    clearCanvas();
    location.reload();
  });

  $.each(['#f00', '#ff0', '#0f0', '#0ff', '#00f', '#f0f', '#000', '#fff'], function() {
    $('#color_drawing .tools').append("<a href='#drawing' data-color='" + this + "' style='width: 10px; background: " + this + ";'></a> ");
  });
  $.each([3, 5, 10], function() {
    $('#color_drawing .tools').append("<a href='#drawing' data-size='" + this + "' style='background: #ccc'>" + this + "</a> ");
  });
  $('#drawing').sketch();
 
  $form.on("submit", function(event) {
      event.preventDefault();
      submitPicture();
  });

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

  function submitPicture() {
    if($canvas.length == 0) {
      return;
    }
    var url = $canvas[0].toDataURL('image/png'),
        img = document.createElement('img'),
        drawings_target = $('#drawings_target'),
        storylineId = $("#storyline_id").val(),
        userId = $("#user_id").val();
    
    drawings_target.append(img); 
    img.src = url;
    $hidden.val(url);

    $.ajax({
       url: "/pictures",
       type: "POST",
       data: {
         image: url,
         storyline_id: storylineId,
         user_id: userId
       },
       error: function(data) {
          console.log("something went wrong");
       },
       success: TelephonePictionary.Picture.successHandler
    });      
  }
});
