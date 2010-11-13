class GameCharactersController < ApplicationController
  def index
    @game = Game.first
    @game_characters = @game.game_characters.all
  end
  
  def show
    @game = Game.first
    @game_character = @game.game_characters.find(params[:id])
  end
  
  def new
    @game = Game.first
    @game_character = @game.game_characters.build
  end
  
  def create
    @game = Game.first
    @game_character = @game.game_characters.build(params[:game_character])
    if @game_character.save
      flash[:notice] = "Successfully created game character."
      redirect_to @game_character
    else
      render :action => 'new'
    end
  end
  
  def edit
    @game = Game.first
    @game_character = @game.game_characters.find(params[:id])
  end
  
  def update
    @game = Game.first
    @game_character = @game.game_characters.find(params[:id])
    if @game_character.update_attributes(params[:game_character])
      flash[:notice] = "Successfully updated game character."
      redirect_to @game_character
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @game = Game.first
    @game_character = @game.game_characters.find(params[:id])
    @game_character.destroy
    flash[:notice] = "Successfully destroyed game character."
    redirect_to game_characters_url
  end
end
