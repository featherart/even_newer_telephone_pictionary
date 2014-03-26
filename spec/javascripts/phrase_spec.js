describe('Phrase', function() {
  
  describe("successHandler", function() {
    it("hides the phrase form", function() {
      var fixtures = setFixtures('<form id="new_phrase"></form>');
      TelephonePictionary.Phrase.successHandler();
      expect(fixtures.find('#new_phrase')).not.toBeVisible();
    });
    
  });  

});