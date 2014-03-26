class PlayersController < ApplicationController
  require 'twilio-ruby'

  def create
    puts "*"*50
    puts "in players create"
    puts "*"*50
    @player = Player.create(params[:player])
    
    #@player.phone_number = 
    text = "Hello #{@player.name}! #{current_user.name} has invited you to play Telephone Pictionary."
    # could this be creating a spam issue? Please log on to http://telephone-pictionary.herokuapp.com to participate!
    #binding.pry
    @player.send_text(text)
    render :json => @player
    #binding.pry
    #render nothing: true
  end
end