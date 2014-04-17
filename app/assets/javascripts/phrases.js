var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Phrase = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a phrase");
    $("#new_phrase").hide();
    $("#phrase_instructions").hide();
    $("#new_phrases").append('<h4><small>Your phrase is below </h4></small><h4 class="subheader">'+ $("#phrase_text").val() +"</h4>");
    $("footer").append("<h4><small>You are a wizard of wordcraft! </small> </h4>");
    $("footer").append('<button class="btn btn-default"><a href="/">next play</a></button><br>');
    $("footer").append("<i class='fa fa-smile-o'></i> <a href='http://tele-pictionary.herokuapp.com/'>share this url</a> to play with a friend.");
  }
};

$(function() {
  
  $form = $("#new_phrase");

  $form.on("submit", function(event) {
    event.preventDefault();
    submitPhrase();
  });
  
  function submitPhrase () {
    var phrase = $("#phrase_text").val(),
        storylineId = $("#storyline_id").val(),
        userId = $("#user_id").val();
    $.ajax({
       url: "/phrases/create/",
       type: "POST",
       data: {
         text: phrase,
         storyline_id: storylineId,
         user_id: userId
       },
       success: TelephonePictionary.Phrase.successHandler
    });
  }    
 });
