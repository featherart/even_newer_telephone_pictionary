require 'spec_helper'

describe PhrasesController do

  describe "#create" do
    context "current storyline is active" do 
      num_phrases = Phrase.all.length
      phrase = Phrase.new
      phrase.text = "test phrase"
      phrase.storyline_id = 2
      phrase.save
      #storyline.active.should eq(true) not sure why this works 
      # in storyline tests but not here!

      phrase.text.should == "test phrase"
      phrase.storyline_id.should == 2
      Phrase.all.length.should == num_phrases + 1

      # also turn # gets incremented by one
      # a turn # should also get assigned to 
      # picture as to show them in order!
    end
  end
end