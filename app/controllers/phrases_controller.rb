class PhrasesController < ApplicationController
  
  def create
    puts "**************"
    puts "in phrase create"
    puts params[:text]
    puts params[:storyline_id]
    puts params
    puts "**************"
    
  	@phrase = Phrase.new(params[:phrase])
  	@phrase.text = params[:text]
    @phrase.storyline_id = params[:storyline_id]
    @phrase.save!
  
    # this needs to happen here for now but there might be a better place
    #Turn.where(turn_number: @storyline.turn).first ? @turn = Turn.where(turn_number: @storyline.turn).first). : @turn.create = 1
    @turn = Turn.last
    @turn.turn_number += 1
    @turn.save!
    @turn_number = @turn.turn_number
    #binding.pry
    render nothing: true
 
  end

  def destroy
    if (params[:id]) != nil
      Storyline.destroy(params[:id])
    end
  end
end
