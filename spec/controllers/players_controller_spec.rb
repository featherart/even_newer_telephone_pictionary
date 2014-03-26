require 'spec_helper'

describe PlayersController do

  describe "#create" do
    players = Player.all.length
    player = Player.new
    player.phone_number = "+15108477006"
    player.email = "test@example.com"
    player.save

    player.phone_number.should == "+15108477006"
    player.email.should == "test@example.com"
    Player.all.length.should == (players + 1)
  end

end