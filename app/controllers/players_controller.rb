class PlayersController < ApplicationController

  def create
    puts "*"*50
    puts "in players create"
    puts "*"*50
    @player = Player.create(params[:player])
    
    @turn = Turn.create(turn_number: 1, user_id: current_user.id)
    @player = Player.create(params[:player])
    @player.name = params[:player][:player_name]
    @player.email = params[:player][:player_email]
    @player.save!
    binding.pry
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
