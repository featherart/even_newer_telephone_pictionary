require 'spec_helper'

describe Player do

  describe "clean_phone_number" do

    it "should do nothing if the user doesn't have a phone number" do
      player = Player.new
      player.phone_number.should be_nil
      player.update_attributes(name: "Max")
      player.reload.phone_number.should be_nil
    end

    it "should clean a phone number with spaces dashes and brackets" do
      player = Player.new
      dirty_number = "(408) 307-2406"
      player.update_attributes(phone_number: dirty_number)
      player.reload.phone_number.should eq("+14083072406")
    end

    it "should not mess up an already perfect phone number" do
      player = Player.new
      clean_number = "+14151234567"
      player.update_attributes(phone_number: clean_number)
      player.reload.phone_number.should eq(clean_number)
    end

  end

end