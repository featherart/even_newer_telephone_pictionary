class StorylinesController < ApplicationController
  #before_filter :require_login
 
  def index
  	@storylines = Storyline.all
    # need a way to signal storyline is complete
    # use a timestamp and set a boolean?
    # turn this on later for now, too annoying to reset each time
    #@active_or_new = Storyline.last.active 
    #@active_or_new ? @storyline = Storyline.last : @storyline = Storyline.new
    @active_or_new = false
    @storyline = Storyline.last
    @turn = Turn.last.turn_number
    #@player = Player.new

  	@phrase = Phrase.new
  	@picture = Picture.new
    
  	respond_to do |format|
  	  format.html
      format.json {@storyline}
      #format.json
  	end
  end

  def create     
    puts "**************"
    puts "in storyline create"
    p params[:storyline]
    p params
    puts "**************" 	
  	@storyline = Storyline.create(params[:storyline])
    @storyline.time_stop = @storyline.created_at + 5.minutes
    @storyline.active = true
    @storyline.story_name = params[:story_name]
    @storyline.num_players = params[:num_players]
    @storyline.user_id = current_user.id
  	@storyline.save!
    #binding.pry
    #@turn = Turn.create(turn_number: 1, user_id: current_user.id)   
    #@player = Player.create(params[:player])
    #@player.name = params[:player][:player_name]
    #@player.email = params[:player][:player_email]
    #@player.save
    #binding.pry
    #@player.phone_number = params[:player][:phone_number]
    #text = "Hello #{@player.name}! #{current_user.name} has invited you to play Telephone Pictionary."
    #@player.send_text(text)
    #render :json => @player
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
  
  # do an ajax call then render the partial that displays a story
  def show 
  	@storyline = Storyline.find(params[:id])

    render partial: 'show_storyline'
  end

end
