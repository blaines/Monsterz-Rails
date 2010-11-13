class CharactersController < ApplicationController
  def index
    @player = Player.find(params[:player_id])
    @characters = @player.characters.all
  end
  
  def show
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:id])
  end
  
  def new
    @player = Player.find(params[:player_id])
    @character = @player.characters.build
  end
  
  def create
    @player = Player.find(params[:player_id])
    @character = @player.characters.build(params[:character])
    if @@player.characters.save
      flash[:notice] = "Successfully created @player.characters."
      redirect_to @character
    else
      render :action => 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:id])
    if @@player.characters.update_attributes(params[:character])
      flash[:notice] = "Successfully updated @player.characters."
      redirect_to @character
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @character = @player.characters.find(params[:id])
    @@player.characters.destroy
    flash[:notice] = "Successfully destroyed @player.characters."
    redirect_to characters_url
  end
end
