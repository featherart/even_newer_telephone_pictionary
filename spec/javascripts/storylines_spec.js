describe('A Storyline', function() {
  
  describe("successHandler", function() {
    it("hides the storyline form", function() {
      var fixtures = setFixtures('<form id="new_storyline"></form>');
      TelephonePictionary.Storyline.successHandler();
      expect(fixtures.find('#new_storyline')).not.toBeVisible();
    });
    
  }); 
   

});