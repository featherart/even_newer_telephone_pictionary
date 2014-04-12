class StorylinesController < ApplicationController
 
  def index
  	@storylines = Storyline.all
    @active_or_new = false
    @storyline = Storyline.last
    @turn = Turn.last.turn_number

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
  
    respond_to do |format|
      format.html { redirect_to new_storyline_path(players: true) }
      format.js
    end
  end
  # do an ajax call then render the partial that displays a story
  def show 
  	@storyline = Storyline.find(params[:id])

    render partial: 'show_storyline'
  end

end
