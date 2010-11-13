class GameLevelsController < ApplicationController
  def index
    @game = Game.first
    @game_levels = @game.game_levels
  end
  
  def show
    @game = Game.first
    @game_level = @game.game_levels.find(params[:id])
  end
  
  def new
    @game = Game.first
    @game_level = @game.game_levels.build
  end
  
  def create
    @game = Game.first
    @game_level = @game.game_levels.build(params[:game_level])
    if @game_level.save
      flash[:notice] = "Successfully created game level."
      redirect_to @game_level
    else
      render :action => 'new'
    end
  end
  
  def edit
    @game = Game.first
    @game_level = @game.game_levels.find(params[:id])
  end
  
  def update
    @game = Game.first
    @game_level = @game.game_levels.find(params[:id])
    if @game_level.update_attributes(params[:game_level])
      flash[:notice] = "Successfully updated game level."
      redirect_to @game_level
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @game = Game.first
    @game_level = @game.game_levels.find(params[:id])
    @game_level.destroy
    flash[:notice] = "Successfully destroyed game level."
    redirect_to game_levels_url
  end
end
