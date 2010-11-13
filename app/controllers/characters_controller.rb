class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end
  
  def show
    @character = Character.find(params[:id])
  end
  
  def new
    @character = Character.new
  end
  
  def create
    @character = Character.new(params[:character])
    if @character.save
      flash[:notice] = "Successfully created character."
      redirect_to @character
    else
      render :action => 'new'
    end
  end
  
  def edit
    @character = Character.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(params[:character])
      flash[:notice] = "Successfully updated character."
      redirect_to @character
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    flash[:notice] = "Successfully destroyed character."
    redirect_to characters_url
  end
end
