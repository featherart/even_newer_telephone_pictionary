require 'spec_helper'

describe StorylinesController do

  it "redirects user to login" do
    # when a user isn't logged in they should get logged in
    # expect { ... }.to raise_error
  end

  describe "#create" do
    context "when logged in" do
      it "creates a new storyline" do
        num_stories = Storyline.all.length
        turns = Turn.all.length
        storyline = Storyline.new
        turn = Turn.new
        turn.turn_number = 1
        turn.save
        storyline.story_name = "test"
        storyline.active = true
        storyline.save
        storyline.time_stop = storyline.created_at + 5.minutes
        storyline.save 
        # it should have a name, a start time and an end time
        # a new turn gets created too, initialized to 1
        storyline.story_name.should eq("test")
        storyline.active.should eq(true)
        storyline.created_at.should_not be_nil
        storyline.time_stop.should eq(storyline.created_at + 5.minutes)
        Storyline.all.length.should eq(num_stories + 1)

        turn.turn_number.should eq(1)
        Turn.all.length.should eq(turns + 1)
      end
    end

    #it { should respond_with_content_type(:json) }

  end

  describe "#show" do
    # it should list all of the pictures and phrases 
    # associated with a storyline
    # it redirects to the show_story partial
  end

  describe "#index" do
    # it lists all the storylines
    # it redirects to the root path
    # it should redirect_to index
  end
end
