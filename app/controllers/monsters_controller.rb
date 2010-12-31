class MonstersController < ApplicationController
  def index
    @player = Player.find(params[:player_id])
    @monsters = @player.monsters.all
  end
  
  def show
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:id])
  end
  
  def new
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.build
  end

#   HTTP POST
  def create
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.build(params[:monster])
    if @monster.save
      flash[:notice] = "Successfully created @player.monsters."
      redirect_to [@player,@monster]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:id])
    if @monster.update_attributes(params[:monster])
      flash[:notice] = "Successfully updated @player.monsters."
      redirect_to [@player,@monster]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:id])
    @monster.destroy
    flash[:notice] = "Successfully destroyed @player.monsters."
    redirect_to player_monsters_url(@player)
  end
end
