class GameMonstersController < ApplicationController
  def index
    @game = Game.first
    @game_monsters = @game.game_monsters.all.asc(:race).asc(:min_level).asc(:name)
  end
  
  def show
    @game = Game.first
    @game_monster = @game.game_monsters.find(params[:id])
  end
  
  def new
    @game = Game.first
    @game_monster = @game.game_monsters.build
  end
  
  def create
    @game = Game.first
    @game_monster = @game.game_monsters.build(params[:game_monster])
    if @game_monster.save
      flash[:notice] = "Successfully created game monster."
      redirect_to @game_monster
    else
      render :action => 'new'
    end
  end
  
  def edit
    @game = Game.first
    @game_monster = @game.game_monsters.find(params[:id])
  end
  
  def update
    @game = Game.first
    @game_monster = @game.game_monsters.find(params[:id])
    if @game_monster.update_attributes(params[:game_monster])
      flash[:notice] = "Successfully updated game monster."
      redirect_to @game_monster
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @game = Game.first
    @game_monster = @game.game_monsters.find(params[:id])
    @game_monster.destroy
    flash[:notice] = "Successfully destroyed game monster."
    redirect_to game_monsters_url
  end
end
