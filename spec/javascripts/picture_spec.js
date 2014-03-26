describe('Picture', function() {
  
  describe("successHandler", function() {
    it("hides the picture form", function() {
      var fixtures = setFixtures('<form id="new_picture"></form>');
      TelephonePictionary.Picture.successHandler();
      expect(fixtures.find('#new_picture')).not.toBeVisible();
    });
    
  });  
  

});
