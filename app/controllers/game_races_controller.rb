class GameRacesController < ApplicationController
  def index
    @game = Game.first
    @game_races = @game.game_races.all
  end
  
  def show
    @game = Game.first
    @game_race = @game.game_races.find(params[:id])
  end
  
  def new
    @game = Game.first
    @game_race = @game.game_races.build
  end
  
  def create
    @game = Game.first
    @game_race = @game.game_races.build(params[:game_race])
    if @game_race.save
      flash[:notice] = "Successfully created game race."
      redirect_to @game_race
    else
      render :action => 'new'
    end
  end
  
  def edit
    @game = Game.first
    @game_race = @game.game_races.find(params[:id])
  end
  
  def update
    @game = Game.first
    @game_race = @game.game_races.find(params[:id])
    if @game_race.update_attributes(params[:game_race])
      flash[:notice] = "Successfully updated game race."
      redirect_to @game_race
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @game = Game.first
    @game_race = @game.game_races.find(params[:id])
    @game_race.destroy
    flash[:notice] = "Successfully destroyed game race."
    redirect_to game_races_url
  end
end
