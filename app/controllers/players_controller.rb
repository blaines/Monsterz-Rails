class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
    # HACK <
    @player.monsters.each {|e| e.issue_turns}
    @player.save
    # HACK >
    player = @player.serializable_hash
    respond_to do |format|
      format.html
      format.xml  { render :xml  => @player }
      format.json { render :json => @player.formatted_hash }
    end
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      flash[:notice] = "Successfully created player."
      redirect_to @player
    else
      render :action => 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:id])
    
    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html {
          flash[:notice] = "Successfully updated player."
          redirect_to @player
        }
        format.any(:xml, :json) { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml  => @player.errors, :status => :unprocessable_entity }
        format.json { render :json => @player.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Successfully destroyed player."
    redirect_to players_url
  end
end
