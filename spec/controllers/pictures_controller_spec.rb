require 'spec_helper'

describe PicturesController do

  context "current storyline is active" do

    describe "#create" do
      num_pictures = Picture.all.length
      picture = Picture.new
      picture.image = "an insanely long string"
      picture.storyline_id = 2
      picture.save

      picture.image.should == "an insanely long string"
      picture.storyline_id.should == 2
      Picture.all.length.should == (num_pictures + 1)

      # also turn # gets incremented by one
      # a turn # should also get assigned to 
      # picture as to show them in order!
    end
  end

end
