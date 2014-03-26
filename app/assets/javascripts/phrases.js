var TelephonePictionary = TelephonePictionary || {}

TelephonePictionary.Phrase = {
  successHandler: function( data ) {
    console.log(data);
    console.log("successfully created a phrase");
    $("#new_phrase").hide();
    $("#new_phrases").append("<h4><small>Your phrase is below! Please log out now.</small></h4><br /><h4 class='subheader'>"+ $("#phrase_text").val() +"</h4>");
  }
};

$(function() {
  console.log("in phrases");
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
